resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = "true"

  tags {
    Name      = "${var.stack_name}"
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
  }
}
