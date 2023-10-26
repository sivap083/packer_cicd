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

source "amazon-ebs" "ubuntu_lts" {
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
  # HCP Packer settings
  hcp_packer_registry {
    bucket_name = "packer-aws"
    description = <<EOT
This is an image for HashiCups application.
    EOT
    bucket_labels = {
      "owner"          = "platform-team"
      "os"             = "Linux",
      "ubuntu-version" = "22.04-LTS"
      "app"            = "nginx"
    }
  }

  sources = [
    "source.amazon-ebs.ubuntu_lts",
  ]

  # systemd unit for HashiCups service
  provisioner "file" {
    source      = "hashicups.service"
    destination = "/tmp/hashicups.service"
  }

  # Set up HashiCups
  provisioner "shell" {
    scripts = ["setup-deps-hashicups.sh"]
  }
  #post-processor "manifest" {
  #  output     = "packer_manifest.json"
  #  strip_path = true
  #  custom_data = {
  #    iteration_id = packer.iterationID
  #  }
  #}

  #post-processor "hcp" {
  #  channel = "development"
  #}
}
