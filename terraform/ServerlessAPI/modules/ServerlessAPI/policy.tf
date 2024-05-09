resource "aws_iam_policy" "dynamo_read" {
  name        = "LibraryDynamoRead"
  description = "Dynamo Read Access"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "dynamodb:Query",
          "dynamodb:GetItem"
        ]
        Effect   = "Allow"
        Resource = aws_dynamodb_table.library.arn
      },
    ]
  })
}

resource "aws_iam_policy" "dynamo_write" {
  name        = "LibraryDynamoWrite"
  description = "Dynamo Write Access"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "dynamodb:PutItem"
        ]
        Effect   = "Allow"
        Resource = aws_dynamodb_table.library.arn
      },
    ]
  })
}
