module "gen_helm_values" {
  # source = "schollii/gen-files/local"
  source = "../../.."

  stack_id     = "staging"
  config_roots = ["../my-micro-svc/deploy-config", "../my-micro-svc/test-config"]

  # the keys and values in template_vars are completely arbitrary:
  tmpl_vars = {
    cluster_name = "staging"
    sg_ingress   = "sg-1234567"
    aws_region   = "us-east-1"
  }
}