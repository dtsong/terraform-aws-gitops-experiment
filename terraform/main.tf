terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.27"
    }
  }

  required_version = ">=0.14.9"

  backend "s3" {
    key = "global/s3/terraform.tfstate"
  }
}

provider "aws" {
  version = "~>3.0"
  region  = "us-west-2"
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 1.0"

  bucket        = "acme-test-application-bucket"
  acl           = "private"
  force_destroy = true

  // S3 bucket-level Public Access Block configuration
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

// resource "aws_s3_bucket" "s3Bucket" {
//   bucket = "acme-test-application"
//   acl    = "public-read"

//   policy = <<EOF
// {
//    "Version" : "2012-10-17",
//    "Statement" : [
//       {
//          "Action" : [
//              "s3:GetObject"
//           ],
//          "Effect" : "Allow",
//          "Resource" : "arn:aws:s3:::acme-test-application/*",
//          "Principal" : "*"
//       }
//     ]
//   }
// EOF

//   website {
//     index_document = "index.html"
//   }
// }