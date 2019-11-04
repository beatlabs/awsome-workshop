variable "vpc_id" {}
variable "region" {}
variable "stack_name" {}
variable "public_subnet1_cidr" {}
variable "public_subnet2_cidr" {}
variable "public_subnet3_cidr" {}

variable "az_region_map" {
  type = "map"
}
