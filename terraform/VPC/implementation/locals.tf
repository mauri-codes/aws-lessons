locals {
  subnet_prefix = "labs-sn"
  subnet_config = {
    "${local.subnet_prefix}-web-A" = {
      az = "us-east-1a"
      cidr = "10.16.0.0/20"
    }
    "${local.subnet_prefix}-web-B" = {
      az = "us-east-1b"
      cidr = "10.16.16.0/20"
    }
    "${local.subnet_prefix}-web-C" = {
      az = "us-east-1c"
      cidr = "10.16.32.0/20"
    }
    "${local.subnet_prefix}-app-A" = {
      az = "us-east-1a"
      cidr = "10.16.64.0/20"
    }
    "${local.subnet_prefix}-app-B" = {
      az = "us-east-1b"
      cidr = "10.16.80.0/20"
    }
    "${local.subnet_prefix}-app-C" = {
      az = "us-east-1c"
      cidr = "10.16.96.0/20"
    }
    "${local.subnet_prefix}-db-A" = {
      az = "us-east-1a"
      cidr = "10.16.128.0/20"
    }
    "${local.subnet_prefix}-db-B" = {
      az = "us-east-1b"
      cidr = "10.16.144.0/20"
    }
    "${local.subnet_prefix}-db-C" = {
      az = "us-east-1c"
      cidr = "10.16.160.0/20"
    }
  }
}