data "aws_caller_identity" "current" {}

data "aws_iam_user" "admin_user" {
  user_name = "admin"
}
