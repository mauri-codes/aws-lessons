module "test_module" {
  source      = "../../modules/test_module"
  bucket_name = "upb-test-bucket-24"
  action_list = [
    "s3:PutObject",
    "s3:GetObject",
    "s3:ListAllMyBuckets"
  ]
  user_name = "test_${local.admin_user_id}"
}


