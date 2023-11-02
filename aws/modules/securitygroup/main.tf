resource "aws_security_group" "packer_sg" {
  name        = var.security_group_name
  description = var.security_group_description

  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = [var.allowed_cidr]
  }

  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = [var.allowed_cidr]
  }
}