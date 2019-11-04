output "k8s_public_domain_certificate_id" {
  value = "${module.acm-k8s-public.public_domain_certificate_id}"
}

output "k8s_public_domain_certificate_arn" {
  value = "${module.acm-k8s-public.public_domain_certificate_arn}"
}

output "k8s_private_domain_certificate_id" {
  value = "${module.acm-k8s-private.public_domain_certificate_id}"
}

output "k8s_private_domain_certificate_arn" {
  value = "${module.acm-k8s-private.public_domain_certificate_arn}"
}

output "k8s_public_fullchain_domain_certificate_id" {
  value = "${module.acm-k8s-fullchain.certificate_id}"
}

output "k8s_public_fullchain_domain_certificate_arn" {
  value = "${module.acm-k8s-fullchain.certificate_arn}"
}
