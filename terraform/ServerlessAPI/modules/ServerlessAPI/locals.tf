locals {
  region = data.aws_region.current.name
  account_id = data.aws_caller_identity.current.account_id
  function_definition = {
    PutBook = {
      function_name = "PutBook"
      extra_policy_arns = [
        aws_iam_policy.dynamo_write.arn
      ]
    }
    PutPerson = {
      function_name = "PutPerson"
      extra_policy_arns = [
        aws_iam_policy.dynamo_write.arn
      ]
    }
    BorrowBook = {
      function_name = "BorrowBook"
      extra_policy_arns = [
        aws_iam_policy.dynamo_write.arn
      ]
    }
    PersonBooks = {
      function_name = "PersonBooks"
      extra_policy_arns = [
        aws_iam_policy.dynamo_read.arn
      ]
    }
    PersonBooksByLib = {
      function_name = "PersonBooksByLib"
      extra_policy_arns = [
        aws_iam_policy.dynamo_read.arn
      ]
    }
    ListBooks = {
      function_name = "ListBooks"
      extra_policy_arns = [
        aws_iam_policy.dynamo_read.arn
      ]
    }
  }
}