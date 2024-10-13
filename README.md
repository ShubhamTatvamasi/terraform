# terraform

Setup terraform provider plugins:
```bash
terraform init
```

Formate `.tf` files:
```bash
terraform fmt -recursive
```

Plan all the things to be deployed:
```bash
terraform plan
```

get graph for your infrastructure:
```bash
sudo apt install graphviz
terraform graph | dot -Tsvg > graph.svg
```

Apply on cloud:
```bash
terraform apply
terraform apply -auto-approve
```

apply with variable:
```bash
terraform apply -var "subnet_cidr_block=10.0.10.0/24"
```

apply with variables file:
```bash
terraform apply -var-file terraform-prod.tfvars
```

List current state of the resources created by terraform:
```bash
terraform state list
```

check the state of a specific resource:
```bash
terraform state show aws_vpc.development-vpc
```

delete a specific resource from cloud provider: 
```bash
terraform destroy --target aws_subnet.dev-subnet-2
```

delete everything:
```bash
terraform destroy
terraform destroy -auto-approve
```

