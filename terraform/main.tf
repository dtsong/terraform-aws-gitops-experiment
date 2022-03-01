terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.27"
    }
  }

  required_version = ">=0.14.9"

  backend "s3" {}
}

provider "aws" {
  version = "~>3.0"
  region  = var.region
}

resource "aws_s3_bucket" "s3Bucket" {
  bucket = "acme-test-application"
  acl    = "public-read"

  policy = <<EOF
{
   "Version" : "2012-10-17",
   "Statement" : [
      {
         "Action" : [
             "s3:GetObject"
          ],
         "Effect" : "Allow",
         "Resource" : "arn:aws:s3:::acme-test-application/*",
         "Principal" : "*"
      }
    ]
  }
EOF

  website {
    index_document = "index.html"
  }
}