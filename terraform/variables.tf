variable "region" {
  type        = string
  description = "The AWS region you wish to deploy to"
}

variable "s3_application_bucket_name" {
  type        = string
  description = "The application S3 bucket name"
}

variable "s3_remote_state_bucket_name" {
  type        = string
  description = "The remote state S3 bucket name"
}

variable "s3_remote_state_bucket_key" {
  type        = string
  description = "The remote state S3 bucket key"
}
