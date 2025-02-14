resource "aws_internet_gateway" "Areef-vpc-igw" {
  vpc_id = aws_vpc.Areef-vpc.id

  tags = {
    Name = "Areef-vpc-igw"
  }
}