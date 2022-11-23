resource "aws_vpc" "vpc" {
  cidr_block           = local.cidr_vpc
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${local.name}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${local.name}-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${local.name}-public-rt"
  }
}

resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = local.cidr_public_a
  availability_zone = local.az_a

  tags = {
    Name = "${local.name}-public-a"
  }
}

resource "aws_route_table_association" "public_a_rt" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_subnet" "public_b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = local.cidr_public_b
  availability_zone = local.az_b

  tags = {
    Name = "${local.name}-public-b"
  }
}

resource "aws_route_table_association" "public_b_rt" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_subnet" "public_c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = local.cidr_public_c
  availability_zone = local.az_c

  tags = {
    Name = "${local.name}-public-c"
  }
}

resource "aws_route_table_association" "public_c_rt" {
  subnet_id      = aws_subnet.public_c.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = local.cidr_private_a
  availability_zone = local.az_a

  tags = {
    Name = "${local.name}-private-a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = local.cidr_private_b
  availability_zone = local.az_b

  tags = {
    Name = "${local.name}-private-b"
  }
}

resource "aws_subnet" "private_c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = local.cidr_private_c
  availability_zone = local.az_c

  tags = {
    Name = "${local.name}-private-c"
  }
}
