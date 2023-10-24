terraform {
  backend "s3" {
    bucket = "terraform-state-packer"
    key    = "aws/terraform_hcp.tfstate"
    region = "us-east-1"
  }
}