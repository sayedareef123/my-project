resource "aws_route_table" "Areef-vpc-pub-route-table" {
  vpc_id = aws_vpc.Areef-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Areef-vpc-igw.id
  }
 tags ={
    name ="Areef-vpc-puc-route-table"
 }  

}

resource "aws_route_table" "Areef-vpc-pvt-route-table" {
  vpc_id = aws_vpc.Areef-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.Areef-vpc-natgw.id
  }
 tags ={
    name ="Areef-vpc-pvt-route-table"
 }  
}

resource "aws_route_table_association" "Areef-vpc-route-assoc" {
  subnet_id      = aws_subnet.pub-subnet.id
  route_table_id = aws_route_table.Areef-vpc-pub-route-table.id
}

resource "aws_route_table_association" "Areef-vpc-pvt-route-assoc" {
  subnet_id      = aws_subnet.privet-subnet.id
  route_table_id = aws_route_table.Areef-vpc-pvt-route-table.id
}