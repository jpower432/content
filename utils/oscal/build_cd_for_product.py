#! /usr/bin/python3

"""Build a component definition for a product from pre-existing profiles"""

import argparse
import json
import logging
import os
import pathlib
import sys
import uuid

from trestle.common.const import TRESTLE_HREF_HEADING
from trestle.core.generators import generate_sample_model
from trestle.core.catalog.catalog_interface import CatalogInterface
from trestle.core.control_interface import ControlInterface
from trestle.core.profile_resolver import ProfileResolver
from trestle.oscal.component import (
    ComponentDefinition,
    DefinedComponent,
    ControlImplementation,
    ImplementedRequirement,
)

import ssg.components
import ssg.environment
import ssg.rules
import ssg.build_yaml
from ssg.controls import ControlsManager


# TODO(jpower432): Setup logging
logging.basicConfig(level=logging.INFO)

logger = logging.getLogger(__name__)


SSG_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
VENDOR_ROOT = os.path.join(SSG_ROOT, "vendor")
RULES_JSON = os.path.join(SSG_ROOT, "build", "rule_dirs.json")
BUILD_CONFIG = os.path.join(SSG_ROOT, "build", "build_config.yml")


def _parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Create a component definition for a product."
    )
    parser.add_argument("-o", "--output", help="Path to write the cd to", required=True)
    parser.add_argument(
        "-r",
        "--root",
        help=f"Root of the SSG project. Defaults to {SSG_ROOT}",
        default=SSG_ROOT,
    )
    parser.add_argument(
        "-v",
        "--vendor-dir",
        help="Path to the vendor directory with third party OSCAL artifacts",
        default=VENDOR_ROOT,
    )
    parser.add_argument(
        "-p",
        "--profile",
        help="Main profile href, or name of the profile model in the trestle workspace",
        required=True,
    )
    parser.add_argument(
        "-pr",
        "--product",
        help="Product to build cd with",
        required=True,
    )
    parser.add_argument(
        "-c",
        "--control",
        help="Control to use as the source for control responses amd implementation status",
        required=True,
    )
    parser.add_argument(
        "-j",
        "--json",
        type=str,
        action="store",
        default=RULES_JSON,
        help=f"Path to the rules_dir.json (defaults to {RULES_JSON})",
    )
    parser.add_argument(
        "-b",
        "--build-config-yaml",
        default=BUILD_CONFIG,
        help="YAML file with information about the build configuration",
    )
    parser.add_argument(
        "--component-definition-type",
        choices=["service", "validation"],
        default="service",
        required=False,
        help="Type of component definition to create",
    )
    return parser.parse_args()


class ComponentDefinitionGenerator:
    """Generate a component definition from a product"""

    def __init__(
        self,
        product,
        root,
        json_path,
        build_config_yaml,
        vendor_dir,
        profile_name_or_href,
        control,
    ):
        """
        Initialize the component definition generator and load the necessary files.

        Args:
            product: Product to generate the component definition for
            root: Root of the SSG project
            json_path: Path to the rules_dir.json file
            build_config_yaml: Path to the build_config.yml file
            vendor_dir: Path to the vendor directory
            profile_name_or_href: Name or href of the profile to use
        """
        self.trestle_root = pathlib.Path(vendor_dir)
        self.product = product
        self.root = root

        profile_path, profile_href = self.get_source(profile_name_or_href)
        self.profile_path = profile_path
        self.profile_href = profile_href

        # Try to match by profile and then by label
        (
            self.profile_controls,
            self.controls_by_label,
        ) = self.resolve_profile_to_controls()

        self.env_yaml = self.get_env_yaml(build_config_yaml)
        self.policy_id = control
        self.controls_mgr = self.get_controls_mgr(control)

        with open(json_path, 'r') as f:
            rule_dir_json = json.load(f)
        self.rule_json = rule_dir_json

    def get_env_yaml(self, build_config_yaml):
        """Get the environment yaml."""
        product_dir = os.path.join(self.root, "products", self.product)
        product_yaml_path = os.path.join(product_dir, "product.yml")
        env_yaml = ssg.environment.open_environment(
            build_config_yaml,
            product_yaml_path,
            os.path.join(self.root, "product_properties"),
        )
        return env_yaml

    def get_source(self, profile_name_or_href):
        """Get the source of the profile."""
        profile_in_trestle_dir = '://' not in profile_name_or_href
        profile_href = profile_name_or_href
        if profile_in_trestle_dir:
            local_path = f'profiles/{profile_name_or_href}/profile.json'
            profile_href = TRESTLE_HREF_HEADING + local_path
            profile_path = self.trestle_root / local_path
        else:
            profile_path = profile_href

        return profile_path, profile_href

    def get_controls_mgr(self, control):
        """Get the control response and implementation status from the policy."""
        controls_dir = os.path.join(self.root, "controls")
        controls_manager = ControlsManager(
            controls_dir=controls_dir, env_yaml=self.env_yaml
        )
        controls_manager.load()
        if control not in controls_manager.policies:
            raise ValueError(f"Policy {control} not found in controls")
        return controls_manager

    def resolve_profile_to_controls(self):
        """
        Resolve the profile to a list of control ids.

        Returns:
            profile_controls: List of control ids in the profile
            controls_by_label: Dictionary of controls by label
        """
        profile_resolver = ProfileResolver()
        resolved_catalog = profile_resolver.get_resolved_profile_catalog(
            self.trestle_root,
            self.profile_path,
            block_params=False,
            params_format='[.]',
            show_value_warnings=True,
        )
        profile_controls = set()
        controls_by_label = dict()

        for control in CatalogInterface(resolved_catalog).get_all_controls_from_dict():
            profile_controls.add(control.id)
            label = ControlInterface.get_label(control)
            if label:
                controls_by_label[label] = control.id
                self.handle_parts(control, profile_controls, controls_by_label)
        return profile_controls, controls_by_label

    def handle_parts(self, control, profile_controls, controls_by_label):
        """Handle parts of a control."""
        if control.parts:
            for part in control.parts:
                profile_controls.add(part.id)
                label = ControlInterface.get_label(part)
                if label:
                    controls_by_label[label] = part.id
                self.handle_parts(part, profile_controls, controls_by_label)

    def handle_rule_yaml(self, rule_id: str):
        """Create rule object from rule yaml."""
        rule_dir = self.rule_json[rule_id]['dir']
        guide_dir = self.rule_json[rule_id]['guide']
        product = self.env_yaml['product']
        rule_obj = {'id': rule_id, 'dir': rule_dir, 'guide': guide_dir}
        rule_file = ssg.rules.get_rule_dir_yaml(rule_dir)

        rule_yaml = ssg.build_yaml.Rule.from_yaml(rule_file, env_yaml=self.env_yaml)
        rule_yaml.normalize(product)
        rule_obj['description'] = rule_yaml.description
        rule_obj['fixtext'] = rule_yaml.fixtext
        return rule_obj

    def get_profile_control_id(self, control_name):
        """
        Get control info if it is in the parent profile if it exists.

        Returns:
            control_id: The control id if it is in the profile
        """
        if control_name in self.controls_by_label.keys():
            return self.controls_by_label.get(control_name)
        elif control_name in self.profile_controls:
            return control_name

        logger.warning(f"Control {control_name} not in profile id or label")
        return None

    def create_implemented_requirement(self, control):
        """Create implemented requirement from a control object"""

        logger.info(f"Creating implemented requirement for {control.id}")
        control_id = self.get_profile_control_id(control.id)
        if control_id:
            implemented_req = generate_sample_model(ImplementedRequirement)
            implemented_req.control_id = control_id
            implemented_req.description = control.notes
            # TODO(jpower432): Setup rules in the properties file
            # TODO(jpower432): Set the implementation status property
            return implemented_req
        return None

    def get_control_implementation(self):
        """Get the control implementation for a component."""
        ci = generate_sample_model(ControlImplementation)
        ci.source = self.profile_href
        all_implement_reqs = list()
        for control in self.controls_mgr.get_all_controls(self.policy_id):
            implemented_req = self.create_implemented_requirement(control)
            if implemented_req:
                all_implement_reqs.append(implemented_req)
        ci.implemented_requirements = all_implement_reqs
        return ci

    def create_cd(self, output, component_definition_type="service"):
        """Create a component definition and write it to a file."""
        logger.info(f"Creating component definition for {self.product}")
        component_definition = generate_sample_model(ComponentDefinition)
        component_definition.metadata.title = f"Component definition for {self.product}"
        component_definition.components = list()

        control_implementation = self.get_control_implementation()

        if control_implementation.implemented_requirements:
            oscal_component = DefinedComponent(
                uuid=str(uuid.uuid4()),
                title=self.product,
                type=component_definition_type,
                description=self.product,
                control_implementations=[control_implementation],
            )
            component_definition.components.append(oscal_component)

        output_str = output
        out_path = pathlib.Path(output_str)
        logger.info(f"Writing component definition to {out_path}")
        component_definition.oscal_write(out_path)


def main():
    """Main function."""
    args = _parse_args()
    cd_generator = ComponentDefinitionGenerator(
        args.product,
        args.root,
        args.json,
        args.build_config_yaml,
        args.vendor_dir,
        args.profile,
        args.control,
    )
    try:
        cd_generator.create_cd(args.output, args.component_definition_type)
    except ValueError as e:
        logger.error("Error creating component definition" + f": {e}", exc_info=True)
        sys.exit(2)
    except Exception as e:
        logger.error("Error creating component definition" + f": {e}", exc_info=True)
        sys.exit(1)


if __name__ == "__main__":
    main()
