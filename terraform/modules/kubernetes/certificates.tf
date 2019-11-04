module "acm-k8s-public" {
  source                = "../acm"
  stack_name            = "${var.stack_name}"
  global_domain         = "${var.global_domain}"
  sub_domain            = "${var.kubernetes_subdomain}.${var.sub_domain}"
  public_domain_zone_id = "${var.public_domain_zone_id}"
}

module "acm-k8s-private" {
  source                = "../acm"
  stack_name            = "${var.stack_name}"
  global_domain         = "${var.global_domain}"
  sub_domain            = "private.${var.kubernetes_subdomain}.${var.sub_domain}"
  public_domain_zone_id = "${var.public_domain_zone_id}"
}

module "acm-k8s-fullchain" {
  source                             = "../acm-k8s"
  stack_name                         = "${var.stack_name}"
  certificate_name                   = "${var.stack_name}-k8s-public-fullchain"
  domain_name                        = "*.${var.sub_domain}.${var.global_domain}"
  subject_alternative_names          = ["*.${var.kubernetes_subdomain}.${var.sub_domain}.${var.global_domain}"]
  validate_certificate               = true
  validation_allow_overwrite_records = true
  wait_for_validation                = false
  validation_method                  = "DNS"
  dns_zone_id                        = "${var.public_domain_zone_id}"
}
