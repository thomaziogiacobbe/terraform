terraform {
  backend "s3" {
    key = "backend/tfstate.tfstate"
    bucket = "tf-remote-management"
    region = "us-east-1"
    access_key = ""
    secret_key = ""
  }
}