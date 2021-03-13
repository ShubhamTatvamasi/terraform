subnet_cidr_block = "10.0.20.0/24"
vpc_cidr_block = "10.0.0.0/16"

environment = "development"

cidr_blocks = ["10.0.0.0/16","10.0.30.0/24"]

cidr_blocks_object = [
  {
    cidr_block = "10.0.0.0/16",
    name = "dev-vpc"
  },
  {
    cidr_block = "10.0.10.0/24",
    name = "dev-subnet"
  }
]
