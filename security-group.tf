# security group for primary instance in the primary vpc
resource "aws_security_group" "primary_sg" {
  provider = aws.ap
  vpc_id      = aws_vpc.primary_vpc.id
  name        = "primary_sg"
  description = "security group for the instance of primary subnet in the primary vpc"

  ingress {
    protocol    = "icmp"
    from_port   = -1
    to_port     = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
  protocol    = "-1"
  from_port   = 0
  to_port     = 0
  cidr_blocks = ["0.0.0.0/0"]
}
}

# security group for secondy instance in the secondary vpc
resource "aws_security_group" "secondary_sg" {
  provider    = aws.us
  vpc_id      = aws_vpc.secondary_vpc.id
  name        = "primary_sg"
  description = "security group for the instance of primary subnet in the primary vpc"

  ingress {
    protocol    = "icmp"
    from_port   = -1
    to_port     = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
  protocol    = "-1"
  from_port   = 0
  to_port     = 0
  cidr_blocks = ["0.0.0.0/0"]
}
}