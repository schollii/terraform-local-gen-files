Assumes following directory structure:

    source-repo
      deployments
        _templates_
          auto-root-values-stack.yaml
          auto-root-values-component1.yaml
          STACK_ID_1
            K8S_NAMESPACE_1
              auto-values-stack.yaml
              auto-values-component1.yaml

        values.yaml
        STACK_ID_1
          values.yaml
          K8S_NAMESPACE_1
            values.yaml
           
