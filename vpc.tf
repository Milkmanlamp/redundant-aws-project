resource "aws_vpc" "vpc" {
  cidr_block                       = "10.16.0.0/16"
  assign_generated_ipv6_cidr_block = true
  enable_dns_support               = true
  enable_dns_hostnames             = true

  tags = {
    Name = "${var.site_name}-vpc"
  }
}
resource "aws_eip" "nat_eip" {
  count  = 3
  domain = "vpc"
  tags = {
    Name = "${var.site_name}-nat-eip"
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.site_name}-internet-gateway"
  }
}
resource "aws_nat_gateway" "one" {
  subnet_id     = aws_subnet.web_subnet_a.id
  allocation_id = aws_eip.nat_eip[0].id
  tags = {
    Name = "${var.site_name}-nat-gateway-a"
  }
  depends_on = [aws_internet_gateway.ig]
}
resource "aws_nat_gateway" "two" {
  subnet_id     = aws_subnet.web_subnet_b.id
  allocation_id = aws_eip.nat_eip[1].id
  tags = {
    Name = "${var.site_name}-nat-gateway-b"
  }
  depends_on = [aws_internet_gateway.ig]
}
resource "aws_nat_gateway" "three" {
  subnet_id     = aws_subnet.web_subnet_c.id
  allocation_id = aws_eip.nat_eip[2].id
  tags = {
    Name = "${var.site_name}-nat-gateway-c"
  }
  depends_on = [aws_internet_gateway.ig]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.site_name}-public-route-table"
  }
}
resource "aws_route" "ig" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig.id
}

resource "aws_route_table" "private_1" {
  vpc_id = aws_vpc.vpc.id
  tags   = { Name = "${var.site_name}-private-rt-1" }
}
resource "aws_route" "ng1" {
  route_table_id         = aws_route_table.private_1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.one.id
}

resource "aws_route_table" "private_2" {
  vpc_id = aws_vpc.vpc.id
  tags   = { Name = "${var.site_name}-private-rt-2" }
}
resource "aws_route" "ng2" {
  route_table_id         = aws_route_table.private_2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.two.id
}

resource "aws_route_table" "private_3" {
  vpc_id = aws_vpc.vpc.id
  tags   = { Name = "${var.site_name}-private-rt-3" }
}
resource "aws_route" "ng3" {
  route_table_id         = aws_route_table.private_3.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.three.id
}

resource "aws_route_table_association" "public_assoc_a" {
  subnet_id      = aws_subnet.web_subnet_a.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public_assoc_b" {
  subnet_id      = aws_subnet.web_subnet_b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_assoc_c" {
  subnet_id      = aws_subnet.web_subnet_c.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "app_assoc_1" {
  subnet_id      = aws_subnet.app_subnet_a.id
  route_table_id = aws_route_table.private_1.id
}

resource "aws_route_table_association" "app_assoc_2" {
  subnet_id      = aws_subnet.app_subnet_b.id
  route_table_id = aws_route_table.private_2.id
}

resource "aws_route_table_association" "app_assoc_3" {
  subnet_id      = aws_subnet.app_subnet_c.id
  route_table_id = aws_route_table.private_3.id
}
resource "aws_route_table_association" "db_assoc_1" {
  subnet_id      = aws_subnet.db_subnet_a.id
  route_table_id = aws_route_table.private_1.id
}
resource "aws_route_table_association" "db_assoc_2" {
  subnet_id      = aws_subnet.db_subnet_b.id
  route_table_id = aws_route_table.private_2.id
}
resource "aws_route_table_association" "db_assoc_3" {
  subnet_id      = aws_subnet.db_subnet_c.id
  route_table_id = aws_route_table.private_3.id
}
