description: 'This profile contains configuration checks that align to the

    DISA STIG for Red Hat Enterprise Linux 8 V1R8.


    In addition to being applicable to Red Hat Enterprise Linux 8, DISA recognizes
    this

    configuration baseline as applicable to the operating system tier of

    Red Hat technologies that are based on Red Hat Enterprise Linux 8, such as:


    - Red Hat Enterprise Linux Server

    - Red Hat Enterprise Linux Workstation and Desktop

    - Red Hat Enterprise Linux for HPC

    - Red Hat Storage

    - Red Hat Containers with a Red Hat Enterprise Linux 8 image'
extends: null
metadata:
    version: V1R8
    SMEs:
    - mab879
    - ggbecker
reference: https://public.cyber.mil/stigs/downloads/?_dl_facet_stigs=operating-systems%2Cunix-linux
selections:
- account_disable_post_pw_expiration
- account_emergency_expire_date
- account_temp_expire_date
- account_unique_id
- accounts_authorized_local_users
- accounts_have_homedir_login_defs
- accounts_logon_fail_delay
- accounts_max_concurrent_login_sessions
- accounts_maximum_age_login_defs
- accounts_minimum_age_login_defs
- accounts_no_uid_except_zero
- accounts_password_all_shadowed_sha512
- accounts_password_pam_dcredit
- accounts_password_pam_dictcheck
- accounts_password_pam_difok
- accounts_password_pam_lcredit
- accounts_password_pam_maxclassrepeat
- accounts_password_pam_maxrepeat
- accounts_password_pam_minclass
- accounts_password_pam_minlen
- accounts_password_pam_ocredit
- accounts_password_pam_pwhistory_remember_password_auth
- accounts_password_pam_pwhistory_remember_system_auth
- accounts_password_pam_pwquality_password_auth
- accounts_password_pam_pwquality_system_auth
- accounts_password_pam_retry
- accounts_password_pam_ucredit
- accounts_password_set_max_life_existing
- accounts_password_set_min_life_existing
- accounts_passwords_pam_faillock_audit
- accounts_passwords_pam_faillock_deny
- accounts_passwords_pam_faillock_deny_root
- accounts_passwords_pam_faillock_interval
- accounts_passwords_pam_faillock_unlock_time
- accounts_umask_etc_bashrc
- accounts_umask_etc_csh_cshrc
- accounts_umask_etc_login_defs
- accounts_umask_etc_profile
- accounts_umask_interactive_users
- accounts_user_dot_no_world_writable_programs
- accounts_user_home_paths_only
- accounts_user_interactive_home_directory_defined
- accounts_user_interactive_home_directory_exists
- accounts_users_home_files_groupownership
- accounts_users_home_files_permissions
- agent_mfetpd_running
- aide_check_audit_tools
- aide_scan_notification
- aide_verify_acls
- aide_verify_ext_attributes
- audit_immutable_login_uids
- audit_rules_dac_modification_chmod
- audit_rules_dac_modification_chown
- audit_rules_dac_modification_fchmod
- audit_rules_dac_modification_fchmodat
- audit_rules_dac_modification_fchown
- audit_rules_dac_modification_fchownat
- audit_rules_dac_modification_fremovexattr
- audit_rules_dac_modification_fsetxattr
- audit_rules_dac_modification_lchown
- audit_rules_dac_modification_lremovexattr
- audit_rules_dac_modification_lsetxattr
- audit_rules_dac_modification_removexattr
- audit_rules_dac_modification_setxattr
- audit_rules_execution_chacl
- audit_rules_execution_chcon
- audit_rules_execution_semanage
- audit_rules_execution_setfacl
- audit_rules_execution_setfiles
- audit_rules_execution_setsebool
- audit_rules_file_deletion_events_rename
- audit_rules_file_deletion_events_renameat
- audit_rules_file_deletion_events_rmdir
- audit_rules_file_deletion_events_unlink
- audit_rules_file_deletion_events_unlinkat
- audit_rules_immutable
- audit_rules_kernel_module_loading_delete
- audit_rules_kernel_module_loading_finit
- audit_rules_kernel_module_loading_init
- audit_rules_login_events_lastlog
- audit_rules_media_export
- audit_rules_privileged_commands_chage
- audit_rules_privileged_commands_chsh
- audit_rules_privileged_commands_crontab
- audit_rules_privileged_commands_gpasswd
- audit_rules_privileged_commands_kmod
- audit_rules_privileged_commands_mount
- audit_rules_privileged_commands_newgrp
- audit_rules_privileged_commands_pam_timestamp_check
- audit_rules_privileged_commands_passwd
- audit_rules_privileged_commands_postdrop
- audit_rules_privileged_commands_postqueue
- audit_rules_privileged_commands_ssh_agent
- audit_rules_privileged_commands_ssh_keysign
- audit_rules_privileged_commands_su
- audit_rules_privileged_commands_sudo
- audit_rules_privileged_commands_umount
- audit_rules_privileged_commands_unix_chkpwd
- audit_rules_privileged_commands_unix_update
- audit_rules_privileged_commands_userhelper
- audit_rules_privileged_commands_usermod
- audit_rules_sudoers
- audit_rules_sudoers_d
- audit_rules_suid_privilege_function
- audit_rules_unsuccessful_file_modification_creat
- audit_rules_unsuccessful_file_modification_ftruncate
- audit_rules_unsuccessful_file_modification_open
- audit_rules_unsuccessful_file_modification_open_by_handle_at
- audit_rules_unsuccessful_file_modification_openat
- audit_rules_unsuccessful_file_modification_truncate
- audit_rules_usergroup_modification_group
- audit_rules_usergroup_modification_gshadow
- audit_rules_usergroup_modification_opasswd
- audit_rules_usergroup_modification_passwd
- audit_rules_usergroup_modification_shadow
- auditd_audispd_configure_sufficiently_large_partition
- auditd_data_disk_error_action
- auditd_data_disk_full_action
- auditd_data_retention_action_mail_acct
- auditd_data_retention_space_left_action
- auditd_data_retention_space_left_percentage
- auditd_local_events
- auditd_log_format
- auditd_name_format
- auditd_overflow_action
- banner_etc_issue
- bios_enable_execution_restrictions
- chronyd_client_only
- chronyd_no_chronyc_network
- chronyd_or_ntpd_set_maxpoll
- chronyd_server_directive
- clean_components_post_updating
- configure_bashrc_exec_tmux
- configure_bind_crypto_policy
- configure_crypto_policy
- configure_firewalld_ports
- configure_gnutls_tls_crypto_policy
- configure_kerberos_crypto_policy
- configure_libreswan_crypto_policy
- configure_openssl_crypto_policy
- configure_openssl_tls_crypto_policy
- configure_ssh_crypto_policy
- configure_tmux_lock_after_time
- configure_tmux_lock_command
- configure_usbguard_auditbackend
- coredump_disable_backtraces
- coredump_disable_storage
- dconf_gnome_banner_enabled
- dconf_gnome_disable_ctrlaltdel_reboot
- dconf_gnome_disable_user_list
- dconf_gnome_lock_screen_on_smartcard_removal
- dconf_gnome_login_banner_text
- dconf_gnome_screensaver_idle_delay
- dconf_gnome_screensaver_lock_delay
- dconf_gnome_screensaver_lock_enabled
- dconf_gnome_screensaver_user_locks
- dconf_gnome_session_idle_user_locks
- dir_group_ownership_library_dirs
- dir_ownership_library_dirs
- dir_permissions_library_dirs
- dir_perms_world_writable_root_owned
- dir_perms_world_writable_sticky_bits
- dir_perms_world_writable_system_owned_group
- directory_group_ownership_var_log_audit
- directory_ownership_var_log_audit
- directory_permissions_var_log_audit
- disable_ctrlaltdel_burstaction
- disable_ctrlaltdel_reboot
- disable_users_coredumps
- display_login_attempts
- enable_authselect
- enable_dracut_fips_module
- enable_fips_mode
- encrypt_partitions
- ensure_gpgcheck_globally_activated
- ensure_gpgcheck_local_packages
- ensure_gpgcheck_never_disabled
- ensure_redhat_gpgkey_installed
- file_audit_tools_group_ownership
- file_audit_tools_ownership
- file_audit_tools_permissions
- file_group_ownership_var_log_audit
- file_groupowner_var_log
- file_groupowner_var_log_messages
- file_groupownership_home_directories
- file_groupownership_system_commands_dirs
- file_owner_var_log
- file_owner_var_log_messages
- file_ownership_binary_dirs
- file_ownership_library_dirs
- file_ownership_var_log_audit_stig
- file_permission_user_init_files
- file_permissions_binary_dirs
- file_permissions_etc_audit_auditd
- file_permissions_etc_audit_rulesd
- file_permissions_home_directories
- file_permissions_library_dirs
- file_permissions_sshd_private_key
- file_permissions_sshd_pub_key
- file_permissions_ungroupowned
- file_permissions_var_log
- file_permissions_var_log_audit
- file_permissions_var_log_messages
- gnome_gdm_disable_automatic_login
- grub2_admin_username
- grub2_audit_argument
- grub2_audit_backlog_limit_argument
- grub2_page_poison_argument
- grub2_password
- grub2_pti_argument
- grub2_slub_debug_argument
- grub2_uefi_admin_username
- grub2_uefi_password
- grub2_vsyscall_argument
- harden_sshd_ciphers_openssh_conf_crypto_policy
- harden_sshd_ciphers_opensshserver_conf_crypto_policy
- harden_sshd_macs_openssh_conf_crypto_policy
- harden_sshd_macs_opensshserver_conf_crypto_policy
- install_smartcard_packages
- installed_OS_is_vendor_supported
- kerberos_disable_no_keytab
- kernel_module_atm_disabled
- kernel_module_bluetooth_disabled
- kernel_module_can_disabled
- kernel_module_cramfs_disabled
- kernel_module_firewire-core_disabled
- kernel_module_sctp_disabled
- kernel_module_tipc_disabled
- kernel_module_usb-storage_disabled
- mount_option_boot_efi_nosuid
- mount_option_boot_nosuid
- mount_option_dev_shm_nodev
- mount_option_dev_shm_noexec
- mount_option_dev_shm_nosuid
- mount_option_home_noexec
- mount_option_home_nosuid
- mount_option_nodev_nonroot_local_partitions
- mount_option_nodev_remote_filesystems
- mount_option_nodev_removable_partitions
- mount_option_noexec_remote_filesystems
- mount_option_noexec_removable_partitions
- mount_option_nosuid_remote_filesystems
- mount_option_nosuid_removable_partitions
- mount_option_tmp_nodev
- mount_option_tmp_noexec
- mount_option_tmp_nosuid
- mount_option_var_log_audit_nodev
- mount_option_var_log_audit_noexec
- mount_option_var_log_audit_nosuid
- mount_option_var_log_nodev
- mount_option_var_log_noexec
- mount_option_var_log_nosuid
- mount_option_var_tmp_nodev
- mount_option_var_tmp_noexec
- mount_option_var_tmp_nosuid
- network_configure_name_resolution
- network_sniffer_disabled
- no_empty_passwords
- no_files_unowned_by_user
- no_host_based_files
- no_tmux_in_shells
- no_user_host_based_files
- package_abrt-addon-ccpp_removed
- package_abrt-addon-kerneloops_removed
- package_abrt-cli_removed
- package_abrt-plugin-sosreport_removed
- package_abrt_removed
- package_aide_installed
- package_audit_installed
- package_fapolicyd_installed
- package_firewalld_installed
- package_gssproxy_removed
- package_iprutils_removed
- package_krb5-server_removed
- package_krb5-workstation_removed
- package_libreport-plugin-logger_removed
- package_libreport-plugin-rhtsupport_removed
- package_mcafeetp_installed
- package_opensc_installed
- package_openssh-server_installed
- package_policycoreutils_installed
- package_postfix_installed
- package_python3-abrt-addon_removed
- package_rng-tools_installed
- package_rsh-server_removed
- package_rsyslog-gnutls_installed
- package_rsyslog_installed
- package_sendmail_removed
- package_telnet-server_removed
- package_tftp-server_removed
- package_tmux_installed
- package_tuned_removed
- package_usbguard_installed
- package_vsftpd_removed
- partition_for_home
- partition_for_tmp
- partition_for_var
- partition_for_var_log
- partition_for_var_log_audit
- partition_for_var_tmp
- postfix_client_configure_mail_alias_postmaster
- postfix_prevent_unrestricted_relay
- require_emergency_target_auth
- require_singleuser_auth
- root_permissions_syslibrary_files
- rsyslog_cron_logging
- rsyslog_encrypt_offload_actionsendstreamdriverauthmode
- rsyslog_encrypt_offload_actionsendstreamdrivermode
- rsyslog_encrypt_offload_defaultnetstreamdriver
- rsyslog_remote_access_monitoring
- rsyslog_remote_loghost
- security_patches_up_to_date
- selinux_policytype
- selinux_state
- selinux_user_login_roles
- service_auditd_enabled
- service_autofs_disabled
- service_debug-shell_disabled
- service_fapolicyd_enabled
- service_firewalld_enabled
- service_kdump_disabled
- service_rngd_enabled
- service_rsyslog_enabled
- service_sshd_enabled
- service_systemd-coredump_disabled
- service_usbguard_enabled
- set_password_hashing_algorithm_logindefs
- set_password_hashing_algorithm_passwordauth
- set_password_hashing_algorithm_systemauth
- set_password_hashing_min_rounds_logindefs
- sshd_disable_compression
- sshd_disable_empty_passwords
- sshd_disable_gssapi_auth
- sshd_disable_kerb_auth
- sshd_disable_root_login
- sshd_disable_user_known_hosts
- sshd_disable_x11_forwarding
- sshd_do_not_permit_user_env
- sshd_enable_strictmodes
- sshd_enable_warning_banner
- sshd_print_last_log
- sshd_rekey_limit
- sshd_set_idle_timeout
- sshd_set_keepalive
- sshd_use_strong_rng
- sshd_x11_use_localhost
- sssd_certificate_verification
- sssd_enable_certmap
- sssd_enable_smartcards
- sssd_offline_cred_expiration
- sudo_remove_no_authenticate
- sudo_remove_nopasswd
- sudo_require_reauthentication
- sudo_restrict_privilege_elevation_to_authorized
- sudoers_default_includedir
- sudoers_validate_passwd
- sysctl_crypto_fips_enabled
- sysctl_fs_protected_hardlinks
- sysctl_fs_protected_symlinks
- sysctl_kernel_core_pattern
- sysctl_kernel_dmesg_restrict
- sysctl_kernel_kexec_load_disabled
- sysctl_kernel_kptr_restrict
- sysctl_kernel_perf_event_paranoid
- sysctl_kernel_randomize_va_space
- sysctl_kernel_unprivileged_bpf_disabled
- sysctl_kernel_yama_ptrace_scope
- sysctl_net_core_bpf_jit_harden
- sysctl_net_ipv4_conf_all_accept_redirects
- sysctl_net_ipv4_conf_all_accept_source_route
- sysctl_net_ipv4_conf_all_forwarding
- sysctl_net_ipv4_conf_all_rp_filter
- sysctl_net_ipv4_conf_all_send_redirects
- sysctl_net_ipv4_conf_default_accept_redirects
- sysctl_net_ipv4_conf_default_accept_source_route
- sysctl_net_ipv4_conf_default_send_redirects
- sysctl_net_ipv4_icmp_echo_ignore_broadcasts
- sysctl_net_ipv6_conf_all_accept_ra
- sysctl_net_ipv6_conf_all_accept_redirects
- sysctl_net_ipv6_conf_all_accept_source_route
- sysctl_net_ipv6_conf_all_forwarding
- sysctl_net_ipv6_conf_default_accept_ra
- sysctl_net_ipv6_conf_default_accept_redirects
- sysctl_net_ipv6_conf_default_accept_source_route
- sysctl_user_max_user_namespaces
- tftpd_uses_secure_mode
- usbguard_generate_policy
- wireless_disable_interfaces
- xwindows_remove_packages
- xwindows_runlevel_target
- var_rekey_limit_size=1G
- var_rekey_limit_time=1hour
- var_accounts_user_umask=077
- var_password_pam_difok=8
- var_password_pam_maxrepeat=3
- var_sshd_disable_compression=no
- var_password_hashing_algorithm=SHA512
- var_password_pam_maxclassrepeat=4
- var_password_pam_minclass=4
- var_accounts_minimum_age_login_defs=1
- var_accounts_max_concurrent_login_sessions=10
- var_password_pam_remember=5
- var_password_pam_remember_control_flag=requisite
- var_selinux_state=enforcing
- var_selinux_policy_name=targeted
- var_password_pam_unix_rounds=5000
- var_password_pam_minlen=15
- var_password_pam_ocredit=1
- var_password_pam_dcredit=1
- var_password_pam_dictcheck=1
- var_password_pam_ucredit=1
- var_password_pam_lcredit=1
- var_password_pam_retry=3
- var_sshd_set_keepalive=1
- sshd_approved_macs=stig
- sshd_approved_ciphers=stig
- sshd_idle_timeout_value=10_minutes
- var_accounts_authorized_local_users_regex=rhel8
- var_accounts_passwords_pam_faillock_deny=3
- var_accounts_passwords_pam_faillock_fail_interval=900
- var_accounts_passwords_pam_faillock_unlock_time=never
- var_ssh_client_rekey_limit_size=1G
- var_ssh_client_rekey_limit_time=1hour
- var_accounts_fail_delay=4
- var_account_disable_post_pw_expiration=35
- var_auditd_action_mail_acct=root
- var_time_service_set_maxpoll=18_hours
- var_accounts_maximum_age_login_defs=60
- var_auditd_space_left_percentage=25pc
- var_auditd_space_left_action=email
- var_auditd_disk_error_action=rhel8
- var_auditd_max_log_file_action=syslog
- var_auditd_disk_full_action=rhel8
- var_sssd_certificate_verification_digest_function=sha1
- login_banner_text=dod_banners
- var_authselect_profile=sssd
- var_system_crypto_policy=fips
- var_sudo_timestamp_timeout=always_prompt
- var_slub_debug_options=P
- var_screensaver_lock_delay=5_seconds
unselected_groups: []
platforms: !!set {}
cpe_names: !!set {}
platform: null
filter_rules: ''
title: DISA STIG for Red Hat Enterprise Linux 8
documentation_complete: true
