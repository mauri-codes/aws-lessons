terraform {
  backend "s3" {
    bucket = "deployment-bucket-upb2024"
    key    = "terraform/vpc.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state"
  }
}
