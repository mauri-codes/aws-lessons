terraform {
  backend "s3" {
    bucket = "deployment-bucket-upb2024"
    key    = "terraform/example-terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state"
  }
}
