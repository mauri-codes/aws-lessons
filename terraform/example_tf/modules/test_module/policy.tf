resource "aws_iam_policy" "policy" {
  name        = "user_test_policy"
  path        = "/"
  description = "My test policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = var.action_list
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_group_policy_attachment" "policy_attachment" {
  group      = aws_iam_group.test_group.name
  policy_arn = aws_iam_policy.policy.arn
}
