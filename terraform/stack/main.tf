terraform {
  backend "s3" {
    bucket         = "beat-testing-tfstate"
    key            = "tatooine/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "beat-testing-tfstate"
    profile        = "beat_testing"
  }
}

data "aws_caller_identity" "current" {}

locals {
  stack_bucket                      = "beat-${lower(var.stack_name)}-devops"
  api_spot_ami_owner_account_id     = "${data.aws_caller_identity.current.account_id}"
}

# Stack Placement Account
provider "aws" {
  region  = "${var.region}"
  profile = "${var.aws_account_profile}"
}

module "s3" {
  source = "../modules/s3"

  stack_name       = "${var.stack_name}"
  stack_bucket     = "${local.stack_bucket}"
}

module "base_stack" {
  source = "../modules/base_stack"

  vpc_cidr             = "${var.vpc_cidr}"
  public_subnet1_cidr  = "${var.public_subnet1_cidr}"
  public_subnet2_cidr  = "${var.public_subnet2_cidr}"
  public_subnet3_cidr  = "${var.public_subnet3_cidr}"
  private_subnet1_cidr = "${var.private_subnet1_cidr}"
  private_subnet2_cidr = "${var.private_subnet2_cidr}"
  private_subnet3_cidr = "${var.private_subnet3_cidr}"

  region               = "${var.region}"
  global_domain        = "${var.global_domain}"
  sub_domain           = "${var.sub_domain}"
  stack_name           = "${var.stack_name}"

  openvpn_ami           = "${var.openvpn_ami}"
  openvpn_tunnel_net    = "${var.openvpn_tunnel_net}"
}

module "kubernetes" {
  source                = "../modules/kubernetes"
  stack_name            = "${var.stack_name}"
  global_domain         = "${var.global_domain}"
  sub_domain            = "${var.sub_domain}"
  public_domain_zone_id = "${module.base_stack.public_domain_zone_id}"
  kubernetes_subdomain  = "${var.kubernetes_subdomain}"
}

module "monitoring_k8s" {
  source = "git@github.com:beatlabs/awsome-demo-apps.git?ref=master//monitoring/terraform"

  kubernetes_worker_principal = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/nodes.${var.sub_domain}.${var.global_domain}"

  name_prefix = "${var.stack_name}"
  description = "Managed by Terraform for ${var.stack_name} stack"
}

module "externaldns_k8s" {
  source = "git@github.com:beatlabs/awsome-demo-apps.git?ref=master//external-dns/terraform"

  kubernetes_worker_principal = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/nodes.${var.sub_domain}.${var.global_domain}"

  name_prefix = "${var.stack_name}"
  description = "Managed by Terraform for ${var.stack_name} stack"
}

module "traefik-k8s" {
  source                      = "git@github.com:beatlabs/awsome-demo-apps.git?ref=master//traefik/terraform"
  kubernetes_worker_principal = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/nodes.${var.sub_domain}.${var.global_domain}"
  name_prefix                 = "${lower(var.stack_name)}"
  description                 = "Managed by Terraform for ${var.stack_name} stack"
  public_domain_zone_id       = "${module.base_stack.public_domain_zone_id}"
}

module "autoscaler_k8s" {
  source                      = "git@github.com:beatlabs/awsome-demo-apps.git?ref=master//cluster-autoscaler/terraform"
  kubernetes_worker_principal = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/nodes.${var.sub_domain}.${var.global_domain}"
  name_prefix                 = "${lower(var.stack_name)}"
  description                 = "Managed by Terraform for ${var.stack_name} stack"
}
