output "config_files_created_last_apply" {
  value = [for src, dest in local.all_templ_files: dest]
}
