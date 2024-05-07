module "GetUser" {
  source = "../../../modules/lambda"
  function_name = "GetUser"
  handler = "api.getUser"
  infra_bucket = "deployment-bucket-upb2024"
  package_key_location = "lambda/apiGetUser.zip"
  extra_policy_arns = []
  env_vars = {}
}

module "PutUser" {
  source = "../../../modules/lambda"
  function_name = "PutUser"
  handler = "api.putUser"
  infra_bucket = "deployment-bucket-upb2024"
  package_key_location = "lambda/apiPutUser.zip"
  extra_policy_arns = []
  env_vars = {}
}

module "DeleteUser" {
  source = "../../../modules/lambda"
  function_name = "DeleteUser"
  handler = "api.deleteUser"
  infra_bucket = "deployment-bucket-upb2024"
  package_key_location = "lambda/apiDeleteUser.zip"
  extra_policy_arns = []
  env_vars = {}
}
