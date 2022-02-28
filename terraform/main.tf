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
  block_public_acls = true
  block_public_policy = true
  restrict_public_buckets = true

  policy = <<EOF
{
   "id" : "MakePublic",
   "version" : "2012-10-17",
   "statement" : [
      {
         "action" : [
             "s3:GetObject"
          ],
         "effect" : "Allow",
         "resource" : "arn:aws:s3:::acme-test-application/*",
         "principal" : "*"
      }
    ]
  }
EOF

  website {
    index_document = "index.html"
  }
}