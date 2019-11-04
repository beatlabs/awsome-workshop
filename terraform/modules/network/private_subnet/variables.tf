variable "vpc_id" {}
variable "region" {}
variable "stack_name" {}
variable "private_subnet1_cidr" {}
variable "private_subnet2_cidr" {}
variable "private_subnet3_cidr" {}
variable "nat_gateway1_id" {}
variable "nat_gateway2_id" {}
variable "nat_gateway3_id" {}

variable "az_region_map" {
  type = "map"
}
