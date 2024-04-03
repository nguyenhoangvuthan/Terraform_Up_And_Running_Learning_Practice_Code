terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">= 5.40"
    }
  }
}

provider "aws" {
    region = var.region
}

resource "aws_db_instance" "example" {
  engine = var.engine_name
  engine_version = var.engine_version
  allocated_storage = var.allocated_storage_number
  instance_class = var.instance_class
  db_name = var.name_of_database
  username = var.username
  password = var.password
  skip_final_snapshot = true
}