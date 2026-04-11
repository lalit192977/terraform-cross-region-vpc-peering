# 1st subnet for the primary vpc in the primary region
resource "aws_subnet" "primary_subnet1" {
  vpc_id                  = aws_vpc.primary_vpc.id
  cidr_block              = var.primary_subnet1_cidr
  availability_zone       = data.aws_availability_zones.primary_az1.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "primary_subnet1-${var.primary_region}"
  }
}


# 1st subnet for the primary vpc in the primary region
resource "aws_subnet" "secondary_subnet1" {
  provider                = aws.us
  vpc_id                  = aws_vpc.primary_vpc.id
  cidr_block              = var.secondary_subnet1_cidr
  availability_zone       = data.aws_availability_zones.secondary_az2.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "secondary_subnet1-${var.secondary_region}"
  }
}