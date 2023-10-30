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