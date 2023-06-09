resource "aws_vpc" "vpc-terraform" {
  cidr_block = var.cidr-terraform

  tags = {
    Name        = "vpc-terraform"
    Environment = "Dev"
  }

}

resource "aws_subnet" "subnet-terraform" {
  vpc_id     = aws_vpc.vpc-terraform.id
  cidr_block = var.cidr-terraform

  tags = {
    Name        = "sub_net-terraform"
    Environment = "Dev"
  }
}

resource "aws_internet_gateway" "igw-terraform" {
  vpc_id = aws_vpc.vpc-terraform.id

  tags = {
    Name        = "igw-terraform"
    Environment = "Dev"
  }
}

resource "aws_route_table" "rtb-terraform" {
  vpc_id = aws_vpc.vpc-terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-terraform.id
  }

  tags = {
    Name        = "rtb-terraform"
    Environment = "Dev"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet-terraform.id
  route_table_id = aws_route_table.rtb-terraform.id
}

resource "aws_security_group" "sg-terraform" {

  vpc_id = aws_vpc.vpc-terraform.id

  ingress {
    description = "Deixando aberto somente para acesso SSH."
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "sg-terraform"
  }
}