# region name for primary region vpc
variable "primary_region" {
  description = "aws primary region for vpc peering"
  type        = string
  default     = "ap-south-1"
}

# region name for secondary vpc
variable "secondary_region" {
  description = "aws secondary region for vpc peering"
  type        = string
  default     = "us-east-1"
}

# primary CIDR BLOCK for primary vpc in primary region
variable "primary_cidr_block" {
  description = "cidr range for the primary vpc in the primary region"
  type        = string
  default     = "10.0.0.0/16"
}

# secondary CIDR BLOCK for secondary vpc in secondary region
variable "secondary_cidr_block" {
  description = "cidr range for the secondary vpc in the secondary region"
  type        = string
  default     = "10.1.0.0/16"
}

# CIDR range for 1st subnet for the primary vpc in the primary region
variable "primary_subnet1_cidr" {
  description = "cidr range for the 1st primary subnet for the primary vpc"
  type        = string
  default     = "10.0.1.0/24"
}

# CIDR range for 1st subnet for the secondary vpc in the secondary region
variable "secondary_subnet1_cidr" {
  description = "cidr range for the 1st secondary subnet for the secondary vpc"
  type        = string
  default     = "10.1.1.0/24"
}