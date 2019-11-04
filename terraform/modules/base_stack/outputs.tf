output "private_domain_zone_id" {
  value = "${module.route53.private_domain_zone_id}"
}

output "public_domain_zone_id" {
  value = "${module.route53.public_domain_zone_id}"
}

output "vpc_id" {
  value = "${module.network.vpc_id}"
}

output "public_subnet1_id" {
  value = "${module.network.public_subnet1_id}"
}

output "public_subnet2_id" {
  value = "${module.network.public_subnet2_id}"
}

output "public_subnet3_id" {
  value = "${module.network.public_subnet3_id}"
}

output "private_subnet1_id" {
  value = "${module.network.private_subnet1_id}"
}

output "private_subnet2_id" {
  value = "${module.network.private_subnet2_id}"
}

output "private_subnet3_id" {
  value = "${module.network.private_subnet3_id}"
}

output "public_route_id" {
  value = "${module.network.public_route_id}"
}

output "private1_route_id" {
  value = "${module.network.private1_route_id}"
}

output "private2_route_id" {
  value = "${module.network.private2_route_id}"
}

output "private3_route_id" {
  value = "${module.network.private3_route_id}"
}

# output "public_domain_certificate_id" {
#   value = "${module.acm.public_domain_certificate_id}"
# }

# output "public_domain_certificate_arn" {
#   value = "${module.acm.public_domain_certificate_arn}"
# }

# output "openvpn_security_group_id" {
#   value = "${module.openvpn.security_group_id}"
# }
