resource "aws_vpc" "upb" {
  cidr_block = "10.16.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = var.vpc_name
  }
}


resource "aws_subnet" "subnet" {
  for_each = var.subnet_config
  vpc_id     = aws_vpc.upb.id
  cidr_block = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.key
  }
}

# Internet Gateway
# public Route Table
# private Route Table
# EC2 Instance in private subnet
# EC2 Instance in public subnet
