variable "engine_name" {
  description = "Name of Database Engine"
  type = string
  default = "mysql"
}

variable "allocated_storage_number" {
  description = "Number of allocated storage"
  type = number
  default = 2
}

variable "instance_class" {
  description = "Type of Instance"
  type = string
  default = "db.t3.micro"
}

variable "username" {
  description = "The username to login database"
  type = string
  default = "admin"
}

variable "password" {
  description = "The password to login database"
  type = string
}

variable "region" {
  description = "region of database"
  type = string
  default = "us-east-1"
}

variable "name_of_database" {
  description = "Name of Database"
  type = string
  default = "example_database"
}

variable "engine_version" {
  description = "Version of Engine"
  type = string
  default = "8.0.35"
}