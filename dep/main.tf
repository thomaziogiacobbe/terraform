provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "db" {
  ami = "ami-06b21ccaeff8cd686"
  instance_type = "t2.micro"

  tags = {
    Name = "DbServer"
  }
}

resource "aws_instance" "web" {
  ami = "ami-06b21ccaeff8cd686"
  instance_type = "t2.micro"

  tags = {
    Name = "WebServer"
  }
  depends_on = [ aws_instance.db ]
}

data "aws_instance" "dbsearch" {
  filter {
    name = "tag:Name"
    values = ["DbServer"]
  }
}

output "dbservers" {
  value = data.aws_instance.dbsearch.availability_zone
}