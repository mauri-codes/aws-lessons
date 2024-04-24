locals {
  admin_user_id = data.aws_iam_user.admin_user.user_id
  account_id = data.aws_caller_identity.current.account_id
  s3_bucket_arn = module.test_module.bucket_arn
}

output "my_bucket_arn" {
  value = local.s3_bucket_arn
}
