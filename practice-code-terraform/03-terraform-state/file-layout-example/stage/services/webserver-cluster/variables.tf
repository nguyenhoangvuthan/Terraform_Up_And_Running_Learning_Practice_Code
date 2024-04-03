variable "server_port" {
  description = "The port the server will use for HTTP Requests"
  type = number
  default = 8080
}

variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket used for the database's remote state storage"
  type = string
}

variable "db_remote_state_key" {
  description = "The name of the key in the S3 bucket used for the database's state storage"
  type = string
}

variable "region" {
  description = "The region of database"
  type = string
  default = "us-east-1"
}

variable "ami_id" {
  description = "The ID of image for instance"
  type        = string
  default     = "ami-080e1f13689e07408"
}

variable "instance_type" {
  type = string
  description = "The type of instance"
  default = "t2.micro"
}

variable "protocol" {
  description = "kind of protocol"
  type = string
  default = "tcp"
}

variable "cird_blocks_list" {
  description = "cird_blocks_list"
  type = list(string)
  default = [ "0.0.0.0/0" ]
}