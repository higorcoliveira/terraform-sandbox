terraform {
  # Assumes s3 bucket and dynamo DB table already set up
  # See /code/02-basics/aws-backend
  backend "s3" {
    bucket         = "devops-terraform-poc-bizcap"
    key            = "05-environments/global/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Route53 zone is shared across staging and production
# resource "aws_route53_zone" "primary" {
#   name = "devopsdeployed.com"
# }
