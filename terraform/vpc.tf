
resource "aws_vpc" "project-aws-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "project-aws-vpc"
  }
}

resource "aws_subnet" "project-aws-vm" {
  vpc_id                  = aws_vpc.project-aws-vpc.id
  cidr_block              = "10.0.11.0/24"
  map_public_ip_on_launch = true

  depends_on = [aws_internet_gateway.project-aws-igw]
  tags = {
    Name = "project-aws-vm"
  }
}

resource "aws_subnet" "project-aws-db" {
  vpc_id                  = aws_vpc.project-aws-vpc.id
  cidr_block              = "10.0.12.0/24"
  map_public_ip_on_launch = true

  depends_on = [aws_internet_gateway.project-aws-igw]
  tags = {
    Name = "project-aws-db"
  }
}

resource "aws_subnet" "project-aws-apps" {
  vpc_id                  = aws_vpc.project-aws-vpc.id
  cidr_block              = "10.0.13.0/24"
  map_public_ip_on_launch = true

  depends_on = [aws_internet_gateway.project-aws-igw]
  tags = {
    Name = "project-aws-db"
  }
}

resource "aws_internet_gateway" "project-aws-igw" {
  vpc_id = aws_vpc.project-aws-vpc.id
  tags = {
    Name = "project-aws-igw"
  }
}

resource "aws_route_table" "project-aws-rtb" {
  vpc_id = aws_vpc.project-aws-vpc.id
  tags = {
    Name = "project-aws-rtb"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project-aws-igw.id
  }

}
resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.project-aws-vm.id
  route_table_id = aws_route_table.project-aws-rtb.id
}
