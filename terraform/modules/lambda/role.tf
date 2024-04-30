resource "aws_iam_role" "lambda_role" {
  name = "${var.function_name}LambdaRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
  managed_policy_arns = concat([
    aws_iam_policy.logs_policy.arn
  ], var.extra_policy_arns)
}

resource "aws_iam_policy" "logs_policy" {
  name        = "${var.function_name}LambdaLogsPolicy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:logs:${local.region}:${local.account_id}:*"
      },
      {
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect   = "Allow"
        Resource = [
          "arn:aws:logs:${local.region}:${local.account_id}:log-group:/aws/lambda/Test:*"
        ]
      }
    ]
  })
}
