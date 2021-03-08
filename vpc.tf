resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

   tags = {
    Name = "main_vpc"
    Department = "Production Engineering"
    Today = "Lesson12"
  }

}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main_gw"
  }
}

resource "aws_route_table" "rout_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "main_rt"
  }
}

resource "aws_main_route_table_association" "vpc_associate" {
  vpc_id         = aws_vpc.main.id
  route_table_id = aws_route_table.rout_table.id
}


