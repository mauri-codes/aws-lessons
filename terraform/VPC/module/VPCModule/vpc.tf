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

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.upb.id

  tags = {
    Name = "UPB_IGW"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.upb.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "UPB_public_rt"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.upb.id

  route {
    cidr_block = "10.16.0.0/16"
    gateway_id = "local"
  }

  tags = {
    Name = "UPB_private_rt"
  }
}

resource "aws_route_table_association" "public_association" {
  for_each = toset([ "web-A", "web-B", "web-C" ])
  subnet_id      = aws_subnet.subnet["${local.subnet_prefix}-${each.key}"].id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_association" {
  for_each = toset([ "app-A", "app-B", "app-C", "db-A", "db-B", "db-C" ])
  subnet_id      = aws_subnet.subnet["${local.subnet_prefix}-${each.key}"].id
  route_table_id = aws_route_table.private_rt.id
}

# resource "aws_instance" "web" {
#   ami           = data.aws_ami.linux2023.id
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.subnet["${local.subnet_prefix}-web-A"].id

#   tags = {
#     Name = "PrivateInstance"
#   }
# }

# resource "aws_instance" "app" {
#   ami           = data.aws_ami.linux2023.id
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.subnet["${local.subnet_prefix}-app-A"].id

#   tags = {
#     Name = "PublicInstance"
#   }
# }
