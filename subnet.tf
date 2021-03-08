resource "aws_subnet" "public_sub1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_pub1
  availability_zone = var.zone_pub1
  tags = {
    Name = "hy_public_sub1"
  }
}

resource "aws_subnet" "public_sub2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_pub2
  availability_zone = var.zone_pub2
  tags = {
    Name = "hy_public_sub2"
  }
}
