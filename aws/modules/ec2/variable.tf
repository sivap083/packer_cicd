variable "region" {
  type        = string
  description = "Region to create EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "Size of the Instance"
}

variable "instance_name" {
  description = "Name of the instance"
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the EC2 instance."
}