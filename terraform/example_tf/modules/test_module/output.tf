output "user_id" {
  value = aws_iam_user.test_user.id
}
output "bucket_arn" {
  value = aws_s3_bucket.test_bucket.arn
}
