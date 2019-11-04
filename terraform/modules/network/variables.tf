variable "vpc_cidr" {}
variable "region" {}
variable "stack_name" {}
variable "public_subnet1_cidr" {}
variable "public_subnet2_cidr" {}
variable "public_subnet3_cidr" {}
variable "private_subnet1_cidr" {}
variable "private_subnet2_cidr" {}
variable "private_subnet3_cidr" {}

variable "az_region_map" {
  type = "map"

  "default" = {
    eu-west-1.AZ0 = "eu-west-1a"
    eu-west-1.AZ1 = "eu-west-1b"
    eu-west-1.AZ2 = "eu-west-1c"

    us-east-1.AZ0 = "us-east-1a"
    us-east-1.AZ1 = "us-east-1b"
    us-east-1.AZ2 = "us-east-1c"

    us-west-1.AZ0 = "us-west-1a"
    us-west-1.AZ1 = "us-west-1c"
    us-west-1.AZ2 = "us-west-1a"
  }
}
