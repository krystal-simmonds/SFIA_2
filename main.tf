provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "jenkins" {
  ami           = var.ami
  instance_type = var.type
}

resource "aws_instance" "test" {
  ami           = var.ami
  instance_type = var.type
}

resource "aws_db_instance" "default" {
  allocated_storage   = 20
  storage_type        = "gp2"
  engine              = "mysql"
  engine_version      = "5.7"
  instance_class      = "db.t2.micro"
  name                = "app_db"
  username            = "admin"
  password            = "password123"
  skip_final_snapshot = true
}

resource "aws_db_instance" "test" {
  allocated_storage   = 20
  storage_type        = "gp2"
  engine              = "mysql"
  engine_version      = "5.7"
  instance_class      = "db.t2.micro"
  name                = "test_db"
  username            = "admin"
  password            = "password123"
  skip_final_snapshot = true
}
