# primary instance public ip address
output "primary_public_ip" {
  value = aws_instance.primary_instance1.public_ip
}

# primary instance private ip address
output "primary_private_ip" {
  value = aws_instance.primary_instance1.private_ip
}

# secondary instance public ip address
output "secondary_public_ip" {
  value = aws_instance.secondary_instance1.public_ip
}

# secondary instance private ip address
output "secondary_private_ip" {
  value = aws_instance.secondary_instance1.private_ip
}


# output "primary_azs" {
#   value = data.aws_availability_zones.primary_az1.names
# }

# output "secondary_azs" {
#   value = data.aws_availability_zones.secondary_az2.names
# }
# output "image_id" {
#   value = data.aws_ami.primary_ami.id
# }