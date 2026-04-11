# primary vpc in the primary region
resource "aws_vpc" "primary_vpc" {
  cidr_block           = var.primary_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name        = "primary-vpc-${var.primary_region}"
    Environment = "testing"
  }
}

# secondary vpc in the secondary region
resource "aws_vpc" "secondary_vpc" {
  cidr_block           = var.secondary_cidr_block
  provider             = aws.us
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "secondary-vpc-${var.secondary_region}"
    Environment = "testing"
  }
}