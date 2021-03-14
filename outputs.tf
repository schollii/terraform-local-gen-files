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
  value = local.override_tmpl_fileset_glob
}

output "num_config_roots" {
  value = length(local.config_roots)
}

output "num_config_roots_no_base" {
  value = length(local.config_roots_no_tmpl_base)
}

output "num_config_roots_no_overrides" {
  value = length(local.config_roots_no_tmpl_overrides)
}

output "num_config_roots_no_tmpl_found" {
  value = length(local.config_roots_no_tmpl)
}

output "config_roots_no_tmpl_found" {
  value = var.output_config_roots_no_tmpl_found ? keys(local.config_roots_no_tmpl) : ["<unknown>"]
}