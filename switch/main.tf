provider "aws" {
  region = "us-east-1"
}

variable "environment" {
  type = string
}

module "ec2" {
  source = "./modules/ec2"
  count = var.environment == "prod" ? 1 : 0
}