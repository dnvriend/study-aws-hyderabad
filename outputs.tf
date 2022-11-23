output "instance_public_ip" {
  value = aws_instance.instance.public_ip
}

output "instance_public_dns" {
  value = aws_instance.instance.public_dns
}

output "region" {
  value = local.region_selected
}
