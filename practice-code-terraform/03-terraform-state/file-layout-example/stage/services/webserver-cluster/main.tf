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

resource "aws_launch_configuration" "example" {
  image_id =var.ami_id
  instance_type = var.instance_type
  security_groups = ["${aws_security_group.instance.id}"]
  user_data = "${data.template_file.user_data.rendered}"
}

data "template_file" "user_data" {
  template = "${file("user-data.sh")}"

  vars = {
    server_port = var.server_port
    db_address = "${data.terraform_remote_state.address}"
    db_port = "${data.terraform_remote_state.port}"
  }

}


data "terraform_remote_state" "db" {
    backend = "s3"

    config = {
      bucket = var.db_remote_state_bucket
      key = var.db_remote_state_key
      region = var.region
    }
}

data "aws_availability_zones" "all" {}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port = var.server_port
    to_port = var.server_port
    protocol = var.protocol
    cidr_blocks = var.cird_blocks_list
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "elb" {
  name = "terraform-example-elb"

  ingress {
    from_port = 80
    to_port = 80
    protocol = var.protocol
    cidr_blocks = var.cird_blocks_list
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = var.cird_blocks_list
  }
}

resource "aws_autoscaling_group" "example" {
  launch_configuration = "${aws_launch_configuration.example.id}"
  availability_zones = ["${data.aws_availability_zones.all.names}"]
  load_balancers = [ "${aw_elb.example.name}" ]
  health_check_type = "ELB"

  min_size = 2
  max_size = 10

  tag {
    key = "Name"
    value = "terraform-asg-example"
    propagate_at_launch = true
  }
}

resource "aws_elb" "example" {
  name = "terraform-asg-example"
  availability_zones = [ "${data.aws_availability_zones.all.names}" ]
  security_groups = ["${aws_security_group.elb.id}"]

  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = var.server_port
    instance_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:${var.server_port}"
  }
}