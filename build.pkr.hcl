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
  }
}

source "amazon-ebs" "my_ubuntu_image" {
  region        = "us-east-1"
  source_ami    = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  ssh_username  = "ubuntu"
  ami_name      = "my_ubuntu_image_{{timestamp}}"
  tags = {
    OS_Version = "Ubuntu"
    Release    = "Latest"
    Name  = "Ubuntu_Packer"
    #Base_AMI_Name = "{{ .SourceAMIName }}"
    #Extra = "{{ .SourceAMITags.TagName }}"
  }
}

build {
  name   = "my-first-build"
  sources = ["source.amazon-ebs.my_ubuntu_image"]

  provisioner "shell" {
    scripts = [ "script.sh" ]
  }
  #post-processor "vagrant" {}
  #post-processor "compress" {}

}