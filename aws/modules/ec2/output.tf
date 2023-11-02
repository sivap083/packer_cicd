output "ubuntu_iteration" {
  value = data.hcp_packer_iteration.ubuntu
}

output "ubuntu_us_east_1" {
  value = data.hcp_packer_image.ubuntu_us_east_1
}

output "instance_id" {
  value = aws_instance.app_server.id
}