module "gen_helm_values" {
    source = "git::https://github.com/schollii/terraform-local-gen-files.git"

    stack_id     = "YOUR_CLUSTER_NAME"
    config_roots = ["YOUR_APP_DIR/config"]
    tpl_name     = "values.yaml"

    # the keys and values in template_vars are completely arbitrary:
    template_vars = {
      cluster_name  = "YOUR_CLUSTER_NAME"
      sg_ingress    = "SECURITY_GROUP_NAME"
      aws_region    = "us-east-1"
    }
  }