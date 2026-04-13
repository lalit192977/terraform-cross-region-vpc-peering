# available availability zones in the primary region
data "aws_availability_zones" "primary_az1" {
  provider = aws.ap
  state = "available"
}

# availabile availability zones in the secondary region
data "aws_availability_zones" "secondary_az2" {
  state    = "available"
  provider = aws.us
}

# aws ami for primary region
data "aws_ami" "primary_ami" {
  provider = aws.ap
  owners      = ["099720109477"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}


# aws ami for secondary region
data "aws_ami" "secondary_ami" {
  owners      = ["099720109477"]
  most_recent = true
  provider    = aws.us

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}
