variable "module_id" {
  type        = string
  description = "An ID for the terraform module calling terraform-local-gen-files"
  default     = "stack"
}

variable "stack_id" {
  type        = string
  description = "An ID for the whole stack being provisioned in AWS from the root module"
}

variable "namespace_id" {
  type        = string
  description = "An ID for the namespace for the resources being provisioned"
  default     = null
}

variable "config_roots" {
  type        = list(string)
  description = "List of folders in which the configuration files are located; only those that contain $tmpl_dir will be processed"
}

variable "comment_line" {
  description = "String used for comments in the rendered config files (so a warning about auto-generation can be printed)"
  default     = "#"
}

variable "tmpl_dir" {
  type        = string
  description = "Directory name for root of templates, in each config root dir"
  default     = "_templates_"
}

variable "tmpl_fileset_glob_base" {
  type        = string
  description = "Glob pattern for template file names for stack (see terraform fileset function)"
  default     = "base-auto-values-MODULE_ID.yaml"
}

variable "tmpl_fileset_glob_overrides" {
  type        = string
  description = "Glob pattern for template file names for calling module (see terraform fileset function)"
  default     = "auto-values-MODULE_ID.yaml"
}

variable "tmpl_vars" {
  type        = map(string)
  description = "Template variables for substitutions"
}

variable "tmpl_render_dest_folder" {
  type = string
  description = "Folder in config roots for rendered templates; can be set to empty string"
  default = "stacks"
}

variable "output_config_roots_no_tmpl_found" {
  type        = bool
  description = "If true, the config_roots_no_tmpl_found will include list of config_roots that did not have any filesets"
  default     = false
}

variable "encrypt_fileset_re" {
  type = string
  description = "Regular expression to identify rendered files which need to be encrypted"
  default = "/secrets-*.yaml$"
}

variable "encrypt_command" {
  type = string
  description = "Command to encrypt a rendered file (the file will be appended as last arg)"
  default = "sops -e -i"
}

variable "save_config_roots_no_tmpl_found" {
  type        = bool
  description = "If true, will create file in path.root, containing config_roots that did not have any filesets"
  default     = true
}
