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

source "amazon-ebs" "linux_lts" {
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
This is an image for Red Hat Enterprise Linux.
    EOT
    bucket_labels = {
      "owner" = "automation-team"
      "os"    = "rhel",
      #"ubuntu-version" = "22.04-LTS"
      #"app"            = "nginx"
    }
  }

  sources = [
    "source.amazon-ebs.linux_lts",
  ]

  # systemd unit for HashiCups service
  provisioner "shell" {
    scripts = ["sshd_config.sh"]
  }

  # Install git
  provisioner "shell" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y git",
    ]
  }
  # systemd unit for HashiCups service
  #provisioner "file" {
  #  source      = "hashicups.service"
  #  destination = "/tmp/hashicups.service"
  #}

  # Set up ansible
  provisioner "shell" {
    scripts = ["ansible-install.sh"]
  }

  # Set up ufw
  provisioner "shell" {
    scripts = ["ufw.sh"]
  }

  #post-processor "manifest" {
  #  output     = "packer_manifest.json"
  #  strip_path = true
  #  custom_data = {
  #    iteration_id = packer.iterationID
  #  }
  #}

  post-processor "vagrant" {
    output = "my-vagrant-box.box"
  }
}
