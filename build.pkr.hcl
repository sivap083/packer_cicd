packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
    vagrant = {
      source  = "github.com/hashicorp/vagrant"
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

source "amazon-ebs" "my_ubuntu_image" {
  region        = "${var.region}"
  source_ami    = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  ssh_username  = "${var.username}"
  ami_name      = "${var.image_name}_{{timestamp}}"
  tags = {
    OS_Version = "${var.os_version}"
    Release    = "Latest"
    Name       = "${var.image_name}"
    #Base_AMI_Name = "{{ .SourceAMIName }}"
    #Extra = "{{ .SourceAMITags.TagName }}"
  }
}

build {
  name    = "packer_build"
  sources = ["source.amazon-ebs.my_ubuntu_image"]

  provisioner "ansible" {
    playbook_file = "provision.yaml"
  }
  #post-processor "vagrant" {}
  #post-processor "compress" {}

}
