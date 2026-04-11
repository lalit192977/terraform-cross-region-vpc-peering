# vpc peering requrester form the primary region to the secondary region
resource "aws_vpc_peering_connection" "peer" {
  vpc_id      = aws_vpc.primary_vpc.id
  peer_vpc_id = aws_vpc.secondary_vpc.id
  peer_region = var.primary_region
  auto_accept = false

  tags = {
    Name        = "primary-to-secondary-peering"
    Environment = "testing"
    Side        = "requester"
  }
}


# vpc peering accepter for the requrest of primary region in the secondary region
resource "aws_vpc_peering_connection_accepter" "accept" {
  provider                  = aws.us
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  auto_accept               = true

  tags = {
    Name = "accepter"
  }
}