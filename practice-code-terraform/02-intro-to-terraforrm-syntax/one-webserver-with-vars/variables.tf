variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "ami_id" {
  description = "AMI Id for Instance"
  type        = string
  default     = "ami-080e1f13689e07408"
}

variable "instance_type" {
  description = "Type of Instance"
  type        = string
  default     = "t2.mico"
}

variable "list_example" {
  description = "An example of a list in Terraform"
  type        = list(number)
  default     = [1, 2, 3]
}

variable "map_example" {
  description = "An example of a map in Terraform"
  type        = map(string)
  default = {
    key1 = "value1"
    key2 = "value2"
    key3 = "value3"
  }
}

variable "protocol_type" {
  description = "Kind of Protocol"
  type        = string
  default     = "tcp"
}

variable "cidr_blocks" {
  description = "List cird_blocks"
  type        = list(string)
  default = [ "0.0.0.0/0" ]
}

variable "region" {
  description = "Region of Instance"
  type = string
  default = "us-east-1"
}