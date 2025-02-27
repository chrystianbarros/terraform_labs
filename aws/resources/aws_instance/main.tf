terraform {
  required_version = ">= 1.10.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.88.0"
    }
  }

  backend "s3" {
    bucket = "chrystian-barros-bucket"
    key    = "aws_instance/terraform.tfstate"
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