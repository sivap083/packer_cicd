data "hcp_packer_iteration" "ubuntu" {
  bucket_name = "packer-aws"
  channel     = "latest"
}

data "hcp_packer_image" "ubuntu_us_east_1" {
  bucket_name    = "packer-aws"
  cloud_provider = "aws"
  iteration_id   = data.hcp_packer_iteration.ubuntu.ulid
  region         = var.region
}