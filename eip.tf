# resource "aws_eip" "eip-nat" {
#   vpc = true
#  }

resource "aws_eip" "eip-nat" {
  domain = "vpc"
}


 resource "aws_eip_association" "eip-nat" {
   instance_id   = aws_instance.Areef-instance.id
  allocation_id = aws_eip.eip-nat.id 

 }
