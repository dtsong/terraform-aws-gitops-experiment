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
  bucket = var.s3_application_bucket_name
  acl    = "public-read"

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
         "resource" : "arn:aws:s3:::${var.s3_application_bucket_name}/*",
         "principal" : "*"
      }
    ]
  }
EOF

  website {
    index_document = "index.html"
  }
}