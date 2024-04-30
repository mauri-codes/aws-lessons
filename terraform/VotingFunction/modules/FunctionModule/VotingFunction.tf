module "VotingFunction" {
  source = "../../../modules/lambda"
  function_name = "VotingFunction"
  handler = "vote_function.lambda_handler"
  infra_bucket = "deployment-bucket-upb2024"
  package_key_location = "lambda/VotingFunction.zip"
  extra_policy_arns = []
  env_vars = {}
}