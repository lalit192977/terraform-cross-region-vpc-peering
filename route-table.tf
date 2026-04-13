# route table for primary vpc in the primary region
resource "aws_route_table" "primary_rt" {
  provider = aws.ap
  vpc_id = aws_vpc.primary_vpc.id
}

# route to the internet gateway for primary route table
resource "aws_route" "primary_route-igw" {
  provider = aws.ap
  route_table_id         = aws_route_table.primary_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.primary_igw.id
}



# route table for secondary vpc in the secondary region
resource "aws_route_table" "secondary_rt" {
  provider = aws.us
  vpc_id   = aws_vpc.secondary_vpc.id
}

# route to the internet gateway for secondary route table
resource "aws_route" "secondary_route_igw" {
  provider               = aws.us
  route_table_id         = aws_route_table.secondary_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.secondary_igw.id
}


# route table association for primary vpc with primary subnet in the primary region
resource "aws_route_table_association" "primary_rta" {
  provider = aws.ap
  route_table_id = aws_route_table.primary_rt.id
  subnet_id      = aws_subnet.primary_subnet1.id
}

# route table association for secondary vpc with secondary subnet in the secondary region
resource "aws_route_table_association" "secondary_rta" {
  provider       = aws.us
  route_table_id = aws_route_table.secondary_rt.id
  subnet_id      = aws_subnet.secondary_subnet1.id
}

# ################################ Adding Routes For Peering #######################################
# vpc peering route 1
resource "aws_route" "primary_peer_route_1" {
  provider = aws.ap
  route_table_id            = aws_route_table.primary_rt.id
  destination_cidr_block    = var.secondary_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  depends_on = [aws_vpc_peering_connection_accepter.accept]
}

# vpc peering route 2
resource "aws_route" "secondary_peer_route_1" {
  provider = aws.us
  route_table_id            = aws_route_table.secondary_rt.id
  destination_cidr_block    = var.primary_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  depends_on = [aws_vpc_peering_connection_accepter.accept]
}