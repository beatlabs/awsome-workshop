output "certificate_id" {
  value = "${element(concat(aws_acm_certificate.certificate.*.id, list("")), 0)}"
}

output "certificate_arn" {
  value = "${element(concat(aws_acm_certificate.certificate.*.arn, list("")), 0)}"
}
