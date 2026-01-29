###################################### AZ 1
resource "aws_subnet" "res_subnet_a" {
  cidr_block                      = "10.16.0.0/20"
  vpc_id                          = aws_vpc.vpc.id
  tags                            = { Name = "${var.site_name}-res-subnet-A" }
  availability_zone               = "${var.region}a"
  assign_ipv6_address_on_creation = true

  # Netnum 0 (Ends in ::00)
  ipv6_cidr_block = cidrsubnet(aws_vpc.vpc.ipv6_cidr_block, 8, 0)
}

resource "aws_subnet" "db_subnet_a" {
  cidr_block                      = "10.16.16.0/20"
  vpc_id                          = aws_vpc.vpc.id
  tags                            = { Name = "${var.site_name}-db-subnet-A" }
  availability_zone               = "${var.region}a"
  assign_ipv6_address_on_creation = true

  # Netnum 1 (Ends in ::01)
  ipv6_cidr_block = cidrsubnet(aws_vpc.vpc.ipv6_cidr_block, 8, 1)
}

resource "aws_subnet" "app_subnet_a" {
  cidr_block                      = "10.16.32.0/20"
  vpc_id                          = aws_vpc.vpc.id
  tags                            = { Name = "${var.site_name}-app-subnet-A" }
  availability_zone               = "${var.region}a"
  assign_ipv6_address_on_creation = true

  # Netnum 2 (Ends in ::02) - FIXED CONFLICT
  ipv6_cidr_block = cidrsubnet(aws_vpc.vpc.ipv6_cidr_block, 8, 2)
}

resource "aws_subnet" "web_subnet_a" {
  cidr_block                      = "10.16.48.0/20"
  vpc_id                          = aws_vpc.vpc.id
  tags                            = { Name = "${var.site_name}-web-subnet-A" }
  availability_zone               = "${var.region}a"
  assign_ipv6_address_on_creation = true

  # Netnum 3 (Ends in ::03)
  ipv6_cidr_block = cidrsubnet(aws_vpc.vpc.ipv6_cidr_block, 8, 3)
}

####################################### AZ 2
resource "aws_subnet" "res_subnet_b" {
  cidr_block                      = "10.16.64.0/20"
  vpc_id                          = aws_vpc.vpc.id
  tags                            = { Name = "${var.site_name}-res-subnet-B" }
  availability_zone               = "${var.region}b"
  assign_ipv6_address_on_creation = true

  # Netnum 4 (Ends in ::04)
  ipv6_cidr_block = cidrsubnet(aws_vpc.vpc.ipv6_cidr_block, 8, 4)
}

resource "aws_subnet" "db_subnet_b" {
  cidr_block                      = "10.16.80.0/20"
  vpc_id                          = aws_vpc.vpc.id
  tags                            = { Name = "${var.site_name}-db-subnet-B" }
  availability_zone               = "${var.region}b"
  assign_ipv6_address_on_creation = true # Added missing flag

  # Netnum 5 (Ends in ::05)
  ipv6_cidr_block = cidrsubnet(aws_vpc.vpc.ipv6_cidr_block, 8, 5)
}

resource "aws_subnet" "app_subnet_b" {
  cidr_block                      = "10.16.96.0/20"
  vpc_id                          = aws_vpc.vpc.id
  tags                            = { Name = "${var.site_name}-app-subnet-B" }
  availability_zone               = "${var.region}b"
  assign_ipv6_address_on_creation = true

  # Netnum 6 (Ends in ::06)
  ipv6_cidr_block = cidrsubnet(aws_vpc.vpc.ipv6_cidr_block, 8, 6)
}

resource "aws_subnet" "web_subnet_b" {
  cidr_block                      = "10.16.112.0/20"
  vpc_id                          = aws_vpc.vpc.id
  tags                            = { Name = "${var.site_name}-web-subnet-B" }
  availability_zone               = "${var.region}b"
  assign_ipv6_address_on_creation = true

  # Netnum 7 (Ends in ::07)
  ipv6_cidr_block = cidrsubnet(aws_vpc.vpc.ipv6_cidr_block, 8, 7)
}


####################################### AZ 3
resource "aws_subnet" "res_subnet_c" {
  cidr_block                      = "10.16.128.0/20"
  vpc_id                          = aws_vpc.vpc.id
  tags                            = { Name = "${var.site_name}-res-subnet-C" }
  availability_zone               = "${var.region}c"
  assign_ipv6_address_on_creation = true

  # Netnum 8 (Ends in ::08)
  ipv6_cidr_block = cidrsubnet(aws_vpc.vpc.ipv6_cidr_block, 8, 8)
}

resource "aws_subnet" "db_subnet_c" {
  cidr_block                      = "10.16.144.0/20"
  vpc_id                          = aws_vpc.vpc.id
  tags                            = { Name = "${var.site_name}-db-subnet-C" }
  availability_zone               = "${var.region}c"
  assign_ipv6_address_on_creation = true

  # Netnum 9 (Ends in ::09)
  ipv6_cidr_block = cidrsubnet(aws_vpc.vpc.ipv6_cidr_block, 8, 9)
}

resource "aws_subnet" "app_subnet_c" {
  cidr_block                      = "10.16.160.0/20"
  vpc_id                          = aws_vpc.vpc.id
  tags                            = { Name = "${var.site_name}-app-subnet-C" }
  availability_zone               = "${var.region}c"
  assign_ipv6_address_on_creation = true

  # Netnum 10 (Ends in ::0a) - Hex 10 is 'a'
  ipv6_cidr_block = cidrsubnet(aws_vpc.vpc.ipv6_cidr_block, 8, 10)
}

resource "aws_subnet" "web_subnet_c" {
  cidr_block                      = "10.16.176.0/20"
  vpc_id                          = aws_vpc.vpc.id
  tags                            = { Name = "${var.site_name}-web-subnet-C" }
  availability_zone               = "${var.region}c"
  assign_ipv6_address_on_creation = true

  # Netnum 11 (Ends in ::0b) - Hex 11 is 'b'
  ipv6_cidr_block = cidrsubnet(aws_vpc.vpc.ipv6_cidr_block, 8, 11)
}
