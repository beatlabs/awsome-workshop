resource "aws_acm_certificate" "certificate" {
  domain_name               = "${var.domain_name}"
  subject_alternative_names = ["${var.subject_alternative_names}"]
  validation_method         = "${var.validation_method}"

  tags {
    Name      = "${var.certificate_name}"
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes        = ["subject_alternative_names"]
  }
}

resource "aws_route53_record" "base_domain_validation" {
  depends_on      = ["aws_acm_certificate.certificate"]
  zone_id         = "${var.dns_zone_id}"
  name            = "${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_name}"
  type            = "${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_type}"
  records         = ["${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_value}"]
  allow_overwrite = "${var.validation_allow_overwrite_records}"
  ttl             = 60

  lifecycle {
    ignore_changes = ["name", "records"]
  }
}

resource "aws_route53_record" "k8s_domain_validation" {
  depends_on      = ["aws_acm_certificate.certificate"]
  zone_id         = "${var.dns_zone_id}"
  name            = "${aws_acm_certificate.certificate.domain_validation_options.1.resource_record_name}"
  type            = "${aws_acm_certificate.certificate.domain_validation_options.1.resource_record_type}"
  records         = ["${aws_acm_certificate.certificate.domain_validation_options.1.resource_record_value}"]
  allow_overwrite = "${var.validation_allow_overwrite_records}"
  ttl             = 60

  lifecycle {
    ignore_changes = ["name", "records"]
  }
}

resource "aws_acm_certificate_validation" "certificate_validation" {
  depends_on      = ["aws_acm_certificate.certificate"]
  count           = "${var.validation_method == "DNS" && var.validate_certificate && var.wait_for_validation ? 1 : 0}"
  certificate_arn = "${aws_acm_certificate.certificate.arn}"

  validation_record_fqdns = [
    "${aws_route53_record.base_domain_validation.*.fqdn}",
  ]
}
