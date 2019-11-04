output "public_domain_certificate_id" {
  value = "${element(concat(aws_acm_certificate.public_domain_cert_single.*.id), 0)}"
}

output "public_domain_certificate_arn" {
  value = "${element(concat(aws_acm_certificate.public_domain_cert_single.*.arn), 0)}"
}
