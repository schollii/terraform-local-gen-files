variable "stack_id" {
  type = string
  description = "An identifier for the whole stack being provisioned in AWS"
}

variable "k8s_ns" {
  type    = string
  default = "**"
  description = "The k8s namespace for the resources being provisioned. Defaults to all/any."
}

variable "config_roots" {
  type = list(string)
  description = "List of folders in which the configuration files are located. Must contain _templates_ folder."
}

variable "tpl_name" {
  type = string
  description = "Name of template file to look for in all config_roots folders"
}

variable "tpl_auto_root" {
  type = string
  description = "Filename prefix for root auto files"
  default = "auto-root"
}

variable "tpl_auto" {
  type = string
  description = "Filename prefix for non-root auto files"
  default = "auto"
}

variable "template_vars" {
  type = map(string)
  description = "Template variables for substitutions"
}
