module "PutBook" {
  source = "../../../modules/lambda"
  function_name = "PutBook"
  handler = "api.PutBook"
  infra_bucket = "deployment-bucket-upb2024"
  package_key_location = "lambda/api.zip"
  extra_policy_arns = []
  env_vars = {}
}

module "PutPerson" {
  source = "../../../modules/lambda"
  function_name = "PutPerson"
  handler = "api.PutPerson"
  infra_bucket = "deployment-bucket-upb2024"
  package_key_location = "lambda/api.zip"
  extra_policy_arns = []
  env_vars = {}
}

module "BorrowBook" {
  source = "../../../modules/lambda"
  function_name = "BorrowBook"
  handler = "api.BorrowBook"
  infra_bucket = "deployment-bucket-upb2024"
  package_key_location = "lambda/api.zip"
  extra_policy_arns = []
  env_vars = {}
}

module "PersonBooks" {
  source = "../../../modules/lambda"
  function_name = "PersonBooks"
  handler = "api.PersonBooks"
  infra_bucket = "deployment-bucket-upb2024"
  package_key_location = "lambda/api.zip"
  extra_policy_arns = []
  env_vars = {}
}

module "PersonBooksByLib" {
  source = "../../../modules/lambda"
  function_name = "PersonBooksByLib"
  handler = "api.PersonBooksByLib"
  infra_bucket = "deployment-bucket-upb2024"
  package_key_location = "lambda/api.zip"
  extra_policy_arns = []
  env_vars = {}
}


module "ListBooks" {
  source = "../../../modules/lambda"
  function_name = "ListBooks"
  handler = "api.ListBooks"
  infra_bucket = "deployment-bucket-upb2024"
  package_key_location = "lambda/api.zip"
  extra_policy_arns = []
  env_vars = {}
}
