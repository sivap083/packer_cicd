variable "security_group_name" {
  description = "Name for the security group."
}

variable "security_group_description" {
  description = "Description for the security group."
}

variable "http_port" {
  description = "Port for HTTP (e.g., 80)."
}

variable "ssh_port" {
  description = "Port for SSH (e.g., 22)."
}

variable "allowed_cidr" {
  description = "CIDR block for allowed incoming traffic (e.g., '0.0.0.0/0')."
}