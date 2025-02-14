resource "aws_nat_gateway" "Areef-vpc-natgw" {
  allocation_id = aws_eip.eip-nat.id
  subnet_id     = aws_subnet.privet-subnet.id

  tags = {
    Name = "Areef-vpc-natgw"
  }

  depends_on = [aws_internet_gateway.Areef-vpc-igw]
}