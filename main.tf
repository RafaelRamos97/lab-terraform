terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.1.0"
    }
  }

  backend "s3" {
    bucket = "tscm-rafael"
    key    = "aws-terraform/env/dev/terraform.tfstate"
    region = "us-east-1"

  } 

}

provider "aws" {
  region = var.local
}