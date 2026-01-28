###################################### AZ 1
resource "aws_subnet" "db_subnet_1" {
  cidr_block = "10.16.16.0/20"
  vpc_id     = aws_vpc.vpc.id
  tags = {
    Name = "${var.site_name}-db-subnet-1"
  }
}
resource "aws_subnet" "app_subnet_1" {
  cidr_block = "10.16.32.0/20"
  vpc_id     = aws_vpc.vpc.id
  tags = {
    Name = "${var.site_name}-app-subnet-1"
  }
}

resource "aws_subnet" "web_subnet_1" {
  cidr_block = "10.16.48.0/20"
  vpc_id     = aws_vpc.vpc.id
  tags = {
    Name = "${var.site_name}-web-subnet-1"
  }
}


####################################### AZ 2
resource "aws_subnet" "db_subnet_2" {
  cidr_block = "10.16.80.0/20"
  vpc_id     = aws_vpc.vpc.id
  tags = {
    Name = "${var.site_name}-db-subnet-2"
  }
}
resource "aws_subnet" "app_subnet_2" {
  cidr_block = "10.16.96.0/20"
  vpc_id     = aws_vpc.vpc.id
  tags = {
    Name = "${var.site_name}-app-subnet-2"
  }
}

resource "aws_subnet" "web_subnet_2" {
  cidr_block = "10.16.112.0/20"
  vpc_id     = aws_vpc.vpc.id
  tags = {
    Name = "${var.site_name}-web-subnet-2"
  }
}

####################################### AZ 3
resource "aws_subnet" "db_subnet_3" {
  cidr_block = "10.16.144.0/20"
  vpc_id     = aws_vpc.vpc.id
  tags = {
    Name = "${var.site_name}-db-subnet-3"
  }
}
resource "aws_subnet" "app_subnet_3" {
  cidr_block = "10.16.160.0/20"
  vpc_id     = aws_vpc.vpc.id
  tags = {
    Name = "${var.site_name}-app-subnet-3"
  }
}

resource "aws_subnet" "web_subnet_3" {
  cidr_block = "10.16.176.0/20"
  vpc_id     = aws_vpc.vpc.id
  tags = {
    Name = "${var.site_name}-web-subnet-3"
  }
}
