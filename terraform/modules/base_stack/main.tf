module "network" {
  source = "../network"

  region     = "${var.region}"
  stack_name = "${var.stack_name}"

  vpc_cidr             = "${var.vpc_cidr}"
  public_subnet1_cidr  = "${var.public_subnet1_cidr}"
  public_subnet2_cidr  = "${var.public_subnet2_cidr}"
  public_subnet3_cidr  = "${var.public_subnet3_cidr}"
  private_subnet1_cidr = "${var.private_subnet1_cidr}"
  private_subnet2_cidr = "${var.private_subnet2_cidr}"
  private_subnet3_cidr = "${var.private_subnet3_cidr}"
}

module "route53" {
  source = "../route53"

  global_domain  = "${var.global_domain}"
  sub_domain     = "${var.sub_domain}"
  stack_name     = "${var.stack_name}"
  private_domain = "${var.private_domain}"
  vpc_id         = "${module.network.vpc_id}"
}
