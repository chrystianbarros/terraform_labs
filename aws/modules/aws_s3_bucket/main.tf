terraform {
  required_version = ">= 1.10.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.87.0"
    }
  }

  backend "s3" {
    bucket = "chrystian-barros-bucket-bkp"
    key = "aws_s3_bucket/terraform.tfstate"
    region = "sa-east-1"
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