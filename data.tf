data "hcp_packer_iteration" "ubuntu" {
  bucket_name = "packer-azure"
  channel     = "latest"
}

data "hcp_packer_image" "packer-azure" {
  bucket_name    = "packer-azure"
  cloud_provider = "azure"
  iteration_id   = data.hcp_packer_iteration.ubuntu.ulid
  region         = "eastus"
}