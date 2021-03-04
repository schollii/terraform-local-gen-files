This modules makes it easy to extract terraform state at at the time of `terraform apply` and automatically update helm values files, kustomize 
files or other config files related to kubernetes clusters. This
module is especially useful to those not using the kubernetes or 
helm providers. 

Using it is very simple, and best understood by looking at the
examples. But say you have YOUR_TF_MODULE/main.tf, and you need to 
get the AWS RDS address into the helm chart values file of YOUR_APP_DIR: 

- in YOUR_TF_MODULE/main.tf, write something like this: 
  ```
  module "gen_helm_values" {
    source = "git::https://github.com/schollii/terraform-local-gen-k8s-configs.git"

    stack_id         = "YOUR_CLUSTER_NAME"
    config_roots = "/path/to/YOUR_APP_DIR/helm_values"
    tpl_name         = "values.yaml"

    # the keys and values in template_vars are completely arbitrary:
    template_vars = {
      cluster_name           = "YOUR_CLUSTER_NAME"
      sg_ingress_lb_external = aws_security_group.cluster_wan_alb.id
      aws_region             = var.region
    }
  }
  ```

- This will load the `$config_roots/_templates_/$tpl_name` file as 
    a terraform template and replace all occurrences of the keys of 
    `template_vars` by the corresponding values, and write the result 
    to `$config_roots/stacks/$cluster_name/auto-root-$tpl_name`. The file
    `$config_roots/_templates_/$tpl_name` could eg have the following: 
    ```
    user_url: http://${cluster_name}/user/id
    security:
      group1: ${sg_ingress_lb_external}
    region: ${aws_region}
    ```

- The result is that whenever you `terraform apply` in your YOUR_TF_MODULE
  the file `$config_roots/stacks/auto-root-values.yaml` will be 
  generated, if it has changed as a result of new terraform state. 

This is quite powerful. Eg:

- you could have multiple stacks/clusters, and the values pertaining 
  to each cluster will be in the correct subfolder whenever you 
  terraform apply for that stack/cluster.  
- you could specify a kubernetes namespace via the `k8s_ns` variable, 
  and have additional "specialization" of base template for a namespace, 
  such as 
  `$config_roots/_templates_/$k8s_ns/$tpl_name`
  or even for a specific stack specific namespace in 
  `$config_roots/_templates_/$stack_id/$k8s_ns/$tpl_name`
  In that case the file
  `$config_roots/stacks/$stack_id/$k8s_ns/auto-values.yaml`
  will get regenerated whenever the cluster changes for that stack. 
  Then you could run 
  ```
  helm upgrade --install -f $config_roots/stacks/$stack_id/auto-root-values.yaml \
     -f $config_roots/stacks/$stack_id/$k8s_ns/auto-values.yaml
  ```
- you could have different modules used by your root terraform
  module each write their own values files. Eg given module1 and 
  module2, you could have `$config_roots/_templates_/module1.yaml`
  and `$config_roots/_templates_/module2.yaml` and module1 and 2
  would each have a module "gen_helm_values" with state they 
  are responsible for.

Contributions
=============

Contributions and requests are welcome. It could be made less 
specific to kubernetes if there is interest. 