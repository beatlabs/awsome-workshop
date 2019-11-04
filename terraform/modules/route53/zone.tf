# registesr route53 zone
resource "aws_route53_zone" "public_domain" {
  name = "${var.sub_domain}.${var.global_domain}"

  tags {
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
  }
}
