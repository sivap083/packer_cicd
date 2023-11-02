provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-state-packer"
    key    = "aws/terraform_hcp.tfstate"
    region = "us-east-1"
  }
}

module "security_group" {
  source = "./aws/modules/securitygroup"

  security_group_name        = "packer-sg"
  security_group_description = "security group allowing HTTP and SSH"
  http_port                  = 80
  ssh_port                   = 22
  allowed_cidr               = "0.0.0.0/0"
}

module "aws_instance_devteam" {
  source = "./aws/modules/ec2"

  # Input variables for the module
  region            = "us-east-1"
  instance_type     = "t2.micro"
  instance_name     = "dev-team"
  security_group_id = module.security_group.security_group_id
}


module "aws_instance_qateam" {
  source = "./aws/modules/ec2"

  # Input variables for the module
  region            = "us-east-1"
  instance_type     = "t2.small"
  instance_name     = "qa-team"
  security_group_id = module.security_group.security_group_id
}