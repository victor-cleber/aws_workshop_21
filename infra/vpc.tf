resource "aws_vpc" "main" {
  cidr_block           = "100.64.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = var.vpc_name
  }
}

data "aws_availability_zones" "availability_zones" {
  state = "available"
}

resource "aws_subnet" "alb_subnet_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "100.64.1.0/24"
  availability_zone       = data.aws_availability_zones.availability_zones.names[0]
  map_public_ip_on_launch = "true"

  tags = {
    Name = "${var.vpc_name}_alb_subnet_a"
  }
}

resource "aws_subnet" "app_subnet_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "100.64.2.0/24"
  availability_zone = data.aws_availability_zones.availability_zones.names[0]

  tags = {
    Name = "${var.vpc_name}_app_subnet_a"
  }
}

resource "aws_subnet" "db_subnet_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "100.64.3.0/24"
  availability_zone = data.aws_availability_zones.availability_zones.names[0]

  tags = {
    Name = "${var.vpc_name}_db_subnet_b"
  }
}

resource "aws_subnet" "alb_subnet_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "100.64.4.0/24"
  availability_zone       = data.aws_availability_zones.availability_zones.names[1]
  map_public_ip_on_launch = "true"

  tags = {
    Name = "${var.vpc_name}_alb_subnet_b"
  }
}

resource "aws_subnet" "app_subnet_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "100.64.5.0/24"
  availability_zone = data.aws_availability_zones.availability_zones.names[1]

  tags = {
    Name = "${var.vpc_name}_app_subnet_b"
  }
}


resource "aws_subnet" "db_subnet_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "100.64.6.0/24"
  availability_zone = data.aws_availability_zones.availability_zones.names[1]

  tags = {
    Name = "${var.vpc_name}_db_subnet_a"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}_igw"
  }
}


resource "aws_route_table" "alb_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.vpc_name}_alb_RouteTable"
  }
}

resource "aws_route_table" "app_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}_app_RouteTable"
  }
}

resource "aws_route_table" "db_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}_db_RouteTable"
  }
}

resource "aws_route_table_association" "rt-association-alb-subnet-a" {
  subnet_id      = aws_subnet.alb_subnet_a.id
  route_table_id = aws_route_table.alb_rt.id
}

resource "aws_route_table_association" "rt-association-alb-subnet-b" {
  subnet_id      = aws_subnet.alb_subnet_b.id
  route_table_id = aws_route_table.alb_rt.id
}

resource "aws_route_table_association" "rt-association-app-subnet-a" {
  subnet_id      = aws_subnet.app_subnet_a.id
  route_table_id = aws_route_table.app_rt.id
}

resource "aws_route_table_association" "rt-association-app-subnet-b" {
  subnet_id      = aws_subnet.app_subnet_b.id
  route_table_id = aws_route_table.app_rt.id
}

resource "aws_route_table_association" "rt-association-db-subnet-a" {
  subnet_id      = aws_subnet.db_subnet_a.id
  route_table_id = aws_route_table.db_rt.id
}

resource "aws_route_table_association" "rt-association-db-subnet-b" {
  subnet_id      = aws_subnet.db_subnet_b.id
  route_table_id = aws_route_table.db_rt.id
}