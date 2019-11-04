output "public_domain_zone_id" {
  value = "${aws_route53_zone.public_domain.zone_id}"
}

output "public_domain_name_servers" {
  value = "${aws_route53_zone.public_domain.name_servers}"
}

output "private_domain_zone_id" {
  value = "${aws_route53_zone.private_domain.zone_id}"
}

output "private_domain_name_servers" {
  value = "${aws_route53_zone.private_domain.name_servers}"
}
