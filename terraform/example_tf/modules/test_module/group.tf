resource "aws_iam_group" "test_group" {
  name = var.group_name
}

resource "aws_iam_user" "test_user" {
  name = var.user_name
}

resource "aws_iam_group_membership" "test_membership" {
  name = "test_membership"

  users = [
    aws_iam_user.test_user.name
  ]

  group = aws_iam_group.test_group.name
}
