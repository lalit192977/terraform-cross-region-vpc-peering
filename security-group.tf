# 
resource "aws_security_group" "primary_sg" {
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
}