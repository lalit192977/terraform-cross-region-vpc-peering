# RSA key of size 4096 bits
resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# storing private key locally
resource "local_file" "priate_key" {
  content  = tls_private_key.key.private_key_pem
  filename = "peering-key.pem"
}

# storing public key to the primary region
resource "aws_key_pair" "key1" {
  key_name   = "vpc1-key"
  public_key = tls_private_key.key.public_key_pem
}

# storing public key in the secondary region
resource "aws_key_pair" "key2" {
  provider   = aws.us
  key_name   = "vpc2-key"
  public_key = tls_private_key.key.public_key_pem
}