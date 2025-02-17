terraform {
  required_version = ">= 1.10.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.87.0"
    }
  }
}

provider "aws" {
  region = "sa-east-1"
  default_tags {
    tags = {
      managed_by = "terraform"
    }
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "chrystian-barros-bucket"
}