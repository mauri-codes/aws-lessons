resource "aws_lambda_function" "test_lambda" {
  s3_bucket = var.infra_bucket
  s3_key = var.package_key_location
  s3_object_version = data.aws_s3_object.lambda_code_object.version_id
  function_name = var.function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = var.handler

  runtime = "python3.12"

  environment {
    variables = var.env_vars
  }
}

data "aws_s3_object" "lambda_code_object" {
  bucket = var.infra_bucket
  key    = var.package_key_location
}
