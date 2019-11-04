# registesr route53 zone
resource "aws_route53_zone" "private_domain" {
  name = "${var.private_domain}"

  # vpc expects a list of vps dicts
  vpc = [{
    vpc_id = "${var.vpc_id}"
  }]

  comment = "Managed by Terraform for ${var.stack_name} stack"

  tags {
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
  }
}
