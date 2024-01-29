##################################################################################
# BACKENDS
##################################################################################
# This should be the same everywhere except the key
terraform {
  backend "s3" {
    # Note that there is no key here. This is set by the Gitlab-ci.yml using the $PROJECT_NAME variable
    bucket         = "sample-terraform-remotestate"
    dynamodb_table = "terraform-statelock"
    key            = "ec2/tfstate"
    region         = "eu-central-1"
  }
}

