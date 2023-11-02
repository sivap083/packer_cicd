
provider "aws" {
  region = var.region
}

resource "aws_instance" "app_server" {
  ami           = data.hcp_packer_image.ubuntu_us_east_1.cloud_image_id
  instance_type = var.instance_type
  vpc_security_group_ids  = [var.security_group_id]
  key_name = "testkey"
  tags = {
    Name = var.instance_name
  }
  #user_data = <<-EOF
  #            #!/bin/bash
  #            echo "ansible" | sudo passwd --stdin ec2-user
  #            sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
  #            sudo systemctl restart sshd
  #            EOF
  
}