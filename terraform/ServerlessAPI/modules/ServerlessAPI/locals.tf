locals {
  region = data.aws_region.current.name
  account_id = data.aws_caller_identity.current.account_id
  function_definition = {
    PutBook = {
      function_name = "PutBook"
      extra_policy_arns = []
    }
    PutPerson = {
      function_name = "PutPerson"
      extra_policy_arns = []
    }
    BorrowBook = {
      function_name = "BorrowBook"
      extra_policy_arns = []
    }
    PersonBooks = {
      function_name = "PersonBooks"
      extra_policy_arns = []
    }
    PersonBooksByLib = {
      function_name = "PersonBooksByLib"
      extra_policy_arns = []
    }
    ListBooks = {
      function_name = "ListBooks"
      extra_policy_arns = []
    }
  }
}