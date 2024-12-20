variable "application_name" {
  description = "Application name for taging resources"
  default     = "bokkyland-ado"
  type        = string
}

variable "contact" {
  description = "Contact name for taggin resources"
  default     = "me@example.com"
}

variable "tf_state_bucket" {
  description = "Name of s3 bucket in AWS for storing TF state"
  default     = "devops-tf-state-bookyland-ado"
}

variable "tf_state_lock_table" {
  description = "Name of Dynamo table for storing TF lock"
  default     = "devops-tf-lock-bookyland-ado"
}

variable "aws_region" {
}

data "aws_caller_identity" "current" {}

// Docker Hub
variable "dockerhub_token" {
  description = "Docker Hub token for logging"
}
