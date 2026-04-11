terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.8.0"
    }
  }
}


# primary region
provider "aws" {
  region = var.primary_region
  alias  = "ap"
}

# secondary region
provider "aws" {
  region = var.secondary_region
  alias  = "us"
}