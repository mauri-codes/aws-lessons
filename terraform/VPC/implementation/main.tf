module "test_module" {
  source      = "../module/VPCModule"
  subnet_config = local.subnet_config
  vpc_name = "UPB_VPC"
}


