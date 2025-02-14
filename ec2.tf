resource "aws_instance" "Areef-instance" {
  ami           = "ami-023a307f3d27ea427"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.pub-subnet.id
  vpc_security_group_ids = [aws_security_group.Areef-vpc-sg.id]
  key_name = "Areef-instance"
  associate_public_ip_address = true

  depends_on = [ aws_instance.Demo-instance,aws_internet_gateway.Areef-vpc-igw ]

  user_data = templatefile("frontend.sh", {
    private_ip = aws_instance.Demo-instance.private_ip
      })

  tags = {
    Name = "public-Areef-instance"
  }
}

resource "aws_instance" "Demo-instance" {
  ami           = "ami-023a307f3d27ea427"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.privet-subnet.id
  vpc_security_group_ids = [aws_security_group.Areef-vpc-sg.id]
  key_name = "Areef-instance"
  #associate_public_ip_address = true

  depends_on = [ aws_route_table.Areef-vpc-pvt-route-table,aws_nat_gateway.Areef-vpc-natgw]
  user_data = file("my_sql.sh")

  tags = {
    Name = "pvt-Areef-instance"
  }
}

output "public_ip" {
  description = "ip of public instance"
  value = aws_instance.Areef-instance.public_ip
}

output "private_ip" {
  description = "ip of private instance"
value = aws_instance.Demo-instance.private_ip
}