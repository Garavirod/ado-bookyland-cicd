terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
  }

  backend "s3" {
    bucket         = "${var.tf_state_bucket}"
    key            = "tf-state-setup"
    region         = "${var.aws_region}"
    encrypt        = true
    dynamodb_table = "${var.tf_state_lock_table}"
  }
}

provider "aws" {
  region = "${var.aws_region}"
  default_tags {
    tags = {
      Environment = terraform.workspace
      Prject      = var.application_name
      Contact     = var.contact
      ManageBy    = "Terraform/setup"
    }
  }
}
