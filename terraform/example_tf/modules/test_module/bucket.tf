resource "aws_s3_bucket" "test_bucket" {
  bucket        = "upb-terraform-bucket-3"
  force_destroy = true
}
