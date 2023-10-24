
provider "aws" {
  region = var.region
}

data "hcp_packer_iteration" "ubuntu" {
  bucket_name = "packer-aws"
  channel     = "latest"
}

data "hcp_packer_image" "ubuntu_us_east_1" {
  bucket_name    = "packer-aws"
  cloud_provider = "aws"
  iteration_id   = data.hcp_packer_iteration.ubuntu.ulid
  region         = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = data.hcp_packer_image.ubuntu_us_east_1.cloud_image_id
  instance_type = var.size
  tags = {
    Name = "HCP-Packer"
  }
}

