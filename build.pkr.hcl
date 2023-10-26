
build {
  hcp_packer_registry {
    bucket_name = "packer-azure"
    description = <<EOT
This is an image for hashicups app.
    EOT
    bucket_labels = {
      "owner"          = "azure"
      "os"             = "Linux",
      "ubuntu-version" = "22.04-LTS"
      "app"            = "hashicups"
    }
  }
  sources = [
    "source.azure-arm.ubuntu"
  ]

  # systemd unit for HashiCups service
  #provisioner "file" {
  #  source      = "hashicups.service"
  #  destination = "/tmp/hashicups.service"
  #}

  # Set up Ngnix
  provisioner "shell" {
    scripts = [
      "script.sh"
    ]
  }


  //post-processor "vagrant" {}
  //post-processor "compress" {}

}