resource "aws_vpc" "Areef-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Areef-vpc"
  }
}