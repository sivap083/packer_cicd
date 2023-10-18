packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = "~> 1"
    }
  }
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "region" {}
variable "image_name" {}
variable "username" {}
variable "os_version" {}
variable "winrm_password" {}

source "amazon-ebs" "windows_image" {
  region                  = "${var.region}"
  source_ami              = "${var.ami_id}"
  instance_type           = "${var.instance_type}"
  ami_name                = "${var.image_name}_{{timestamp}}"
  winrm_username          = "${var.username}"
  winrm_password          = "${var.winrm_password}"
  winrm_timeout           = "5m"
  ami_virtualization_type = "hvm"
  communicator            = "winrm"
  user_data_file          = "./bootstrap_win.txt"
  tags = {
    OS_Version = "${var.os_version}"
    Release    = "Latest"
    Name       = "${var.image_name}"
    #Base_AMI_Name = "{{ .SourceAMIName }}"
    #Extra = "{{ .SourceAMITags.TagName }}"
  }
}

build {
  name    = "windows-ami-build"
  sources = ["source.amazon-ebs.windows_image"]

  provisioner "powershell" {
    environment_vars = ["DEVOPS=PACKER"]
    inline           = ["Write-Host \"HELLO NEW USER; WELCOME TO $Env:DEVOPS\"", "Write-Host \"You need to use backtick escapes when using\"", "Write-Host \"characters such as DOLLAR`$ directly in a command\"", "Write-Host \"or in your own scripts.\""]
  }
  provisioner "windows-restart" {
  }
  provisioner "powershell" {
    environment_vars = ["VAR1=A$Dollar", "VAR2=A`Backtick", "VAR3=A'SingleQuote", "VAR4=A\"DoubleQuote"]
    script           = "./sample_script.ps1"
  }

  #provisioner "ansible" {
  #  playbook_file = "provision.yaml"
  #}
  #post-processor "vagrant" {}
  #post-processor "compress" {}

}
