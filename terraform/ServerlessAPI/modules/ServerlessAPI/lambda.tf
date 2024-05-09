module "ApiFunction" {
  for_each = local.function_definition
  source = "../../../modules/lambda"
  function_name = each.key
  handler = "api.${each.value.function_name}"
  infra_bucket = "deployment-bucket-upb2024"
  package_key_location = "lambda/api.zip"
  extra_policy_arns = each.value.extra_policy_arns
  env_vars = {
    DYNAMO_TABLE = aws_dynamodb_table.library.name
  }
}

resource "aws_lambda_permission" "apigw" {
  for_each      = local.function_definition
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = each.value.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.api.execution_arn}/*/*"
}
