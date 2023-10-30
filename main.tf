terraform {
  backend "s3" {
    bucket = "terraform-state-packer"
    key    = "aws/terraform_hcp.tfstate"
    region = "us-east-1"
  }
}

module "aws_instance_devteam" {
  source = "./aws/modules/ec2"

  # Input variables for the module
  region        = "us-east-1"
  instance_type = "t2.micro"
  instance_name = "dev-team"
}


module "aws_instance_qateam" {
  source = "./aws/modules/ec2"

  # Input variables for the module
  region        = "us-east-1"
  instance_type = "t2.small"
  instance_name = "qa-team"
}