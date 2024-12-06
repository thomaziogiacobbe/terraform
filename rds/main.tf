provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "rds" {
  db_name = "myrds"	
  identifier = "first-rds"
  instance_class = "db.t2.micro"
  engine = "mariadb"
  engine_version = "10.2.21"
  username = "admin"
  password = "admin123"
  port = 3306
  allocated_storage = 20
  skip_final_snapshot = true
}