build {
  name = "packer-build"
  sources = [
    "source.azure-arm.ubuntu"
  ]
  provisioner "shell" {
    script       = "script.sh"
}


  //post-processor "vagrant" {}
  //post-processor "compress" {}

}