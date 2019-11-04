module "vpc" {
  source = "./vpc"

  vpc_cidr   = "${var.vpc_cidr}"
  stack_name = "${var.stack_name}"
}

module "public_subnet" {
  source = "./public_subnet"

  region              = "${var.region}"
  stack_name          = "${var.stack_name}"
  vpc_id              = "${module.vpc.vpc_id}"
  public_subnet1_cidr = "${var.public_subnet1_cidr}"
  public_subnet2_cidr = "${var.public_subnet2_cidr}"
  public_subnet3_cidr = "${var.public_subnet3_cidr}"
  az_region_map       = "${var.az_region_map}"
}

module "nat" {
  source = "./nat"

  stack_name        = "${var.stack_name}"
  public_subnet1_id = "${module.public_subnet.public1_id}"
  public_subnet2_id = "${module.public_subnet.public2_id}"
  public_subnet3_id = "${module.public_subnet.public3_id}"
}

module "private_subnet" {
  source = "./private_subnet"

  region               = "${var.region}"
  stack_name           = "${var.stack_name}"
  vpc_id               = "${module.vpc.vpc_id}"
  private_subnet1_cidr = "${var.private_subnet1_cidr}"
  private_subnet2_cidr = "${var.private_subnet2_cidr}"
  private_subnet3_cidr = "${var.private_subnet3_cidr}"
  az_region_map        = "${var.az_region_map}"
  nat_gateway1_id      = "${module.nat.nat_gateway1_id}"
  nat_gateway2_id      = "${module.nat.nat_gateway2_id}"
  nat_gateway3_id      = "${module.nat.nat_gateway3_id}"
}