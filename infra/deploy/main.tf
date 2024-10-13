terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
  }
  backend "s3" {
    bucket               = "devops-tf-state-bookyland-ado"
    key                  = "tf-state-deploy"
    workspace_key_prefix = "tf-state-deploy-env"
    region               = "${var.aws_region}"
    encrypt              = true
    dynamodb_table       = "devops-tf-lock-bookyland-ado"
  }
}

provider "aws" {
  region = "${var.aws_region}"
  default_tags {
    tags = {
      Environment = terraform.workspace
      Project     = var.application_name
      Contact     = var.contact
      ManageBy    = "Terraform/deploy"
    }
  }
}


locals {
  prefix = "${var.prefix}-${terraform.workspace}"
}

data "aws_region" "current" {

}
