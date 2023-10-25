
build {
  hcp_packer_registry {
    bucket_name = "packer-azure"
    description = <<EOT
This is an image for Azure Linux Machine.
    EOT
    bucket_labels = {
      "owner"          = "azure"
      "os"             = "Linux",
      "ubuntu-version" = "22.04-LTS"
      "app"            = "nginx"
    }
  }
  sources = [
    "source.azure-arm.ubuntu"
  ]
  provisioner "shell" {
    script = "script.sh"
  }


  //post-processor "vagrant" {}
  //post-processor "compress" {}

}