# ACM certificate request with DNS verification
resource "aws_acm_certificate" "public_domain_cert_single" {

  domain_name       = "*.${var.sub_domain}.${var.global_domain}"
  validation_method = "DNS"

  tags {
    Name      = "${var.stack_name}"
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
  }

  lifecycle {
    create_before_destroy = true

    # This has been added due to this issue and we need to re-review it as soon as it is resolved
    # https://github.com/terraform-providers/terraform-provider-aws/issues/8531
    ignore_changes = ["subject_alternative_names"]
  }
}

data "aws_route53_zone" "zone_single" {
  zone_id = "${var.public_domain_zone_id}"
}
