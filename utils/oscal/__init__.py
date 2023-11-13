#! /usr/bin/python3

import os

import ssg.products

SSG_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
VENDOR_ROOT = os.path.join(SSG_ROOT, "vendor")
RULES_JSON = os.path.join(SSG_ROOT, "build", "rule_dirs.json")
BUILD_CONFIG = os.path.join(SSG_ROOT, "build", "build_config.yml")


def get_benchmark_root(root: str, product: str) -> str:
    """Get the benchmark root."""
    product_yaml_path = ssg.products.product_yaml_path(root, product)
    product_yaml = ssg.products.load_product_yaml(product_yaml_path)
    product_dir = product_yaml.get("product_dir")
    benchmark_root = os.path.join(product_dir, product_yaml.get("benchmark_root"))
    return benchmark_root
