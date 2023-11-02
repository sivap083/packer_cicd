
provider "aws" {
  region = var.region
}

resource "aws_instance" "app_server" {
  ami           = data.hcp_packer_image.ubuntu_us_east_1.cloud_image_id
  instance_type = var.instance_type
  vpc_security_group_ids  = [var.security_group_id]
  tags = {
    Name = var.instance_name
  }

  provisioner "file" {
    source      = "script.sh"  # Local path to your shell script
    destination = "/tmp/script.sh"          # Remote path on the EC2 instance
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",  # Ensure the script is executable
      "/tmp/script.sh"            # Execute the script
    ]
  }
}