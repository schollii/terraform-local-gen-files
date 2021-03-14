module "gen_helm_values" {
  # source = "git::https://github.com/schollii/terraform-local-gen-files.git"
  source = "../../.."

  stack_id     = "staging"
  config_roots = ["../my-svc-1/config"]

  # the keys and values in template_vars are completely arbitrary:
  tmpl_vars = {
    cluster_name = "YOUR_CLUSTER_NAME"
    sg_ingress   = "SECURITY_GROUP_NAME"
    aws_region   = "us-east-1"
  }
}