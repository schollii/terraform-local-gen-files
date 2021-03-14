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

output "no_root_tmpl_files_found" {
  value = local.no_root_tmpl_files_found
}