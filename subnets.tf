## Im created for pubilc subnet
resource "aws_subnet" "pub-subnet" {
  vpc_id     = aws_vpc.Areef-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "pub-subnet"
  }
}

## Im created for privet subnet
resource "aws_subnet" "privet-subnet" {
  vpc_id     = aws_vpc.Areef-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "privet-subnet"
  }
}
