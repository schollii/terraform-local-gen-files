output "config_files_created_last_apply" {
  description = "List of config files generated from this terraform config"
  value       = [for src, dest in local.all_tmpl_files : dest]
}

output "config_roots" {
  value = local.config_roots
}

output "tmpl_fileset_glob_base" {
  value = local.tmpl_fileset_glob_base
}

output "tmpl_fileset_glob_overrides" {
  value = local.tmpl_fileset_glob_overrides
}

output "num_config_roots_no_base" {
  value = length(local.root_tmpl_files_no_base_found)
}

output "num_config_roots_no_overrides" {
  value = length(local.override_tmpl_files_none_found)
}

output "num_config_roots_no_tmpl_found" {
  value = length(local.config_roots_no_tmpl_found)
}
