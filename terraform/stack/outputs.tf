output "vpc_cidr" {
  value = "${var.vpc_cidr}"
}

output "vpc_id" {
  value = "${module.base_stack.vpc_id}"
}

output "stack_name" {
  value = "${lower(var.stack_name)}"
}

output "stack_dns" {
  value = "${var.sub_domain}.${var.global_domain}"
}

output "stack_region" {
  value = "${var.region}"
}

output "account_id" {
  value = "${data.aws_caller_identity.current.account_id}"
}

output "aws_account_profile" {
  value = "${var.aws_account_profile}"
}

output "public_domain_zone_id" {
  value = "${module.base_stack.public_domain_zone_id}"
}

# output "public_domain_certificate_arn" {
#   value = "${module.base_stack.public_domain_certificate_arn}"
# }

output "stack_bucket" {
  value = "${local.stack_bucket}"
}

output "k8s_public_domain_certificate_arn" {
  value = "${module.kubernetes.k8s_public_domain_certificate_arn}"
}

output "k8s_private_domain_certificate_arn" {
  value = "${module.kubernetes.k8s_private_domain_certificate_arn}"
}

output "k8s_public_fullchain_domain_certificate_arn" {
  value = "${module.kubernetes.k8s_public_fullchain_domain_certificate_arn}"
}

# output "k8s_prometheus_server_role_name" {
#   value = "${module.monitoring_k8s.prometheus_server_role_name}"
# }

# output "k8s_externaldns_k8s_role_name" {
#   value = "${module.externaldns_k8s.externaldns_k8s_role_name}"
# }
