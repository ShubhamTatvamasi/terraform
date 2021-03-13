# terraform

Setup terraform provider plugins:
```bash
terraform init
```

Plan all the things to be deployed:
```bash
terraform plan
```

Apply on cloud:
```bash
terraform apply
terraform apply -auto-approve
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

