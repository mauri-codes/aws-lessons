resource "aws_api_gateway_rest_api" "api" {
  body = data.template_file.api_definition.rendered

  name = "LibraryAPI"
  description = "Library API"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

data "template_file" "api_definition" {
  template = file("api.yaml")
  vars = {
    account_id = local.account_id
    aws_region = local.region
    put_book_lambda = local.function_definition.PutBook.function_name
    put_person_lambda = local.function_definition.PutPerson.function_name
    borrow_book_lambda = local.function_definition.BorrowBook.function_name
    person_books_lambda = local.function_definition.PersonBooks.function_name
    person_books_by_lib_lambda = local.function_definition.PersonBooksByLib.function_name
    list_books_lambda = local.function_definition.ListBooks.function_name
  }
}

resource "aws_api_gateway_deployment" "api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.api.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.api.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "api_stage" {
  deployment_id = aws_api_gateway_deployment.api_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.api.id
  stage_name    = "prod"
}
