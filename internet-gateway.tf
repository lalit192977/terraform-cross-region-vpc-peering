# internet gateway for primary region and for primary vpc
resource "aws_internet_gateway" "primary_igw" {
  provider = aws.ap
  vpc_id = aws_vpc.primary_vpc.id

  tags = {
    Name = "primary-igw-${var.primary_region}"
  }
}

# internet gateway for secondary region for secondary vpc
resource "aws_internet_gateway" "secondary_igw" {
  vpc_id   = aws_vpc.secondary_vpc.id
  provider = aws.us

  tags = {
    Name = "secondary-igw-${var.secondary_region}"
  }
}