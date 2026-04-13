# primary instance
resource "aws_instance" "primary_instance1" {
  provider = aws.ap
  ami           = data.aws_ami.primary_ami.id
  instance_type = var.instance_type
  # availability_zone = data.aws_availability_zones.primary_az1.names[0]
  subnet_id                   = aws_subnet.primary_subnet1.id
  vpc_security_group_ids      = [aws_security_group.primary_sg.id]
  key_name                    = aws_key_pair.key1.key_name
  associate_public_ip_address = true

  tags = {
    Name        = "primary-vpc-instance"
    Environment = "testing"
    Region      = var.primary_region
  }
}


# primary instance
resource "aws_instance" "secondary_instance1" {
  provider = aws.us
  ami           = data.aws_ami.secondary_ami.id
  instance_type = var.instance_type
  # availability_zone = data.aws_availability_zones.primary_az1.names[0]
  subnet_id                   = aws_subnet.secondary_subnet1.id
  vpc_security_group_ids      = [aws_security_group.secondary_sg.id]
  key_name                    = aws_key_pair.key2.key_name
  associate_public_ip_address = true

  tags = {
    Name        = "secondary-vpc-instance"
    Environment = "testing"
    Region      = var.secondary_region
  }
}