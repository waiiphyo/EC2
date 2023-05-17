1. Avoid hardcoding secret key and access key
2. Use terraform.tfvars instead of other <filename>.auto.tfvars
3. Seperate the backend.tf from providers.tf
4. Seperate the egress and ingress resources from Security Group resources
5. Seperate the outputs from main resources