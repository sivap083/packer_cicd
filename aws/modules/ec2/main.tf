
provider "aws" {
  region = var.region
}

resource "aws_instance" "app_server" {
  ami           = data.hcp_packer_image.ubuntu_us_east_1.cloud_image_id
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}