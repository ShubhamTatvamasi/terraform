provider "aws" {
  region = "us-east-2"
}

variable "subnet_cidr_block" {
  description = "subnet cidr block"
  default = "10.0.10.0/24"
  type = string
}

variable "vpc_cidr_block" {
  description = "vpc cidr block"
}

variable "cidr_blocks" {
  description = "cidr blocks for vpc and subnets"
  type = list(string)
}

variable "cidr_blocks_object" {
  description = "cidr blocks for vpc and subnets"
  type = list(object({
    cidr_block = string
    name = string
  }))
}

variable "environment" {
  description = "deployment environment"
}

resource "aws_vpc" "development-vpc" {
  # cidr_block = "10.0.0.0/16"
  # cidr_block = var.vpc_cidr_block
  # cidr_block = var.cidr_blocks[0]
  cidr_block = var.cidr_blocks_object[0].cidr_block
  tags = {
    "Name" = var.cidr_blocks_object[0].name
    # "Name" = var.environment
    # "vpc_env" = "dev"
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id = aws_vpc.development-vpc.id
  # cidr_block = "10.0.10.0/24"
  # cidr_block = var.subnet_cidr_block
  # cidr_block = var.cidr_blocks[1]
  cidr_block = var.cidr_blocks_object[1].cidr_block
  availability_zone = "us-east-2a"
  tags = {
    "Name" = var.cidr_blocks_object[1].name
    # "Name" = "subnet-1-dev"
  }
}

data "aws_vpc" "existing_vpc" {
  default = true
}

resource "aws_subnet" "dev-subnet-2" {
  vpc_id = data.aws_vpc.existing_vpc.id
  cidr_block = "172.31.48.0/20"
  availability_zone = "us-east-2a"
  tags = {
    "Name" = "subnet-4-default"
  }
}

output "dev-vpc-id" {
  value = aws_vpc.development-vpc.id
}

output "dev-subnet-id" {
  value = aws_subnet.dev-subnet-1.id
}
