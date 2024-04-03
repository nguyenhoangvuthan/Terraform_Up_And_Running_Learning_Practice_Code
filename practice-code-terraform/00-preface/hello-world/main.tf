terraform {
  required_version = "1.54.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami = "ami-080e1f13689e07408"
  instance_type = "t2.micro"
}