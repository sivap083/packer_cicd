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

variable "ami_id" {}
variable "instance_type" {}
variable "region" {}
variable "image_name" {}
variable "username" {}
variable "os_version" {}
variable "version" {}

source "amazon-ebs" "my_ubuntu_image" {
  region        = "${var.region}"
  source_ami    = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  ssh_username  = "${var.username}"
  ami_name      = "${var.image_name}_{{timestamp}}_${var.version}"
  tags = {
    OS_Version = "${var.os_version}"
    Release    = "Latest"
    Name       = "${var.image_name}"
  }
}

build {
  name = "packer_build"
  hcp_packer_registry {
    bucket_name = "packer-aws"
    description = <<EOT
This is an image for AWS Linux Machine.
    EOT
    bucket_labels = {
      "owner"          = "platform-team"
      "os"             = "Linux",
      "ubuntu-version" = "22.04-LTS"
      "app" = "nginx"
    }
  }

  sources = ["source.amazon-ebs.my_ubuntu_image"]

  provisioner "shell" {
    scripts = [ "script.sh" ]
  }
  #provisioner "ansible" {
  #  playbook_file = "provision.yaml"
  #}

  #post-processor "vagrant" {}
  #post-processor "compress" {}

}
