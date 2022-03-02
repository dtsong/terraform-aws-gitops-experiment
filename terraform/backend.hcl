# Terraform Remote State Bucket
bucket = "dansong-tf-remote-state"
key    = "global/s3/terraform.tfstate"
region = "us-west-2"

# Terraform State Lock
dynamodb_table = "dansong-terraform-remote-state-lock"
encrypt        = true