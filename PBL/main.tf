provider "aws" {
  region = var.region
}

# Get list of availability zones
data "aws_availability_zones" "available" {
    state = "available"
}
terraform {
  backend "s3" {
    bucket         = "dele-terraform-bucket"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}