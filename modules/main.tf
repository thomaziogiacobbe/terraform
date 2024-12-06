provider "aws" {
  region = "us-east-1"
}

module "ec2_module" {
  source = "./ec2"
  ec2_name = "Name from module"
}

output "module_output" {
  value = module.ec2_module.instance_id
}