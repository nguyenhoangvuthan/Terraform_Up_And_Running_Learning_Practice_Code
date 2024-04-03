variable "bucket_name" {
  description = "The name of the S3 bucket. Must be globally unique"
  type = string
  default = "terraform-up-and-running-state-nhvthan"
}

variable "region" {
  description = "Region of bucket"
  type = string
  default = "us-east-1"
}