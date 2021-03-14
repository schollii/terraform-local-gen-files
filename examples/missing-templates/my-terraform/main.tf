module "gen_config_values" {
  # source = "git::https://github.com/schollii/terraform-local-gen-files.git"
  source = "../../.."

  stack_id     = "my-stack-1"
  module_id    = "my-module"
  config_roots = ["../my-micro-svc/deploy-config"]

  # the keys and values in template_vars are completely arbitrary:
  tmpl_vars = {
    cluster_name = "my-stack"
    sg_ingress   = "sg-1234567"
    aws_region   = "us-east-1"
  }
}

output "config_roots_no_tmpl_base" {
  value = module.gen_config_values.num_config_roots_no_base
}

output "config_roots_no_tmpl" {
  value = module.gen_config_values.num_config_roots_no_tmpl_found
}