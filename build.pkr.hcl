build {
  name = "packer-build"
  sources = [
    "source.azure-arm.windows"
  ]

  #provisioner "powershell" {
    #script = "./install-software.ps1"
  #}
  provisioner "windows-restart" {
  }




  //post-processor "vagrant" {}
  //post-processor "compress" {}

}