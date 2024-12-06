provider "aws" {
  region = "us-east-1"
}

module "db" {
  source = "./db"
  server_names = ["mariadb", "mysql", "postgresql"]
}

output "private_ips" {
  value = module.db.PrivateIP
}