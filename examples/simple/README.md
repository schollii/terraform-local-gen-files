simple example: 

one micro-service with a config file

from your-terraform:

run terraform init
run terraform apply

see how your-micro-svc/config/stacks was created, with subfolder
YOUR_CLUSTER_NAME containing file auto-root-infra.env (this file
contains some environment variables). 