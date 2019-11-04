# Define local variables
locals {
  base_stack               = "tatooine"
  k8s_master_instance_size = "m5.large"
  k8s_master_count         = "3"
  k8s_node_instance_size   = "m5.2xlarge"
  k8s_node_count           = "3"
  kubernetes_version       = "1.12.10"
  k8s_s3_path_suffix       = "/kubernetes-kops"
}


# Define the s3 bucket to save the currnet tfstate
terraform {
  backend "s3" {
    bucket         = "beat-testing-tfstate"
    key            = "tatooine-k8s/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "beat-testing-tfstate"
    profile        = "beat_testing"
  }
}


# Define the s3 bucket from stack create, to fetch the needed variables here.
data "terraform_remote_state" "base" {
  backend = "s3"

  config {
    bucket  = "beat-testing-tfstate"
    key     = "${local.base_stack}/terraform.tfstate"
    region  = "eu-west-1"
    profile = "beat_testing"
  }
}


# Configure the output variables
# + Local Variables , defined in this main config

output "k8s_master_instance_size" {
  value = "${local.k8s_master_instance_size}"
}

output "k8s_master_count" {
  value = "${local.k8s_master_count}"
}

output "k8s_node_instance_size" {
  value = "${local.k8s_node_instance_size}"
}

output "k8s_node_count" {
  value = "${local.k8s_node_count}"
}

output "kubernetes_version" {
  value = "${local.kubernetes_version}"
}




# +  Remote variables, from stack's s3 bucket

output "stack_name" {
  value = "${data.terraform_remote_state.base.stack_name}"
}

output "stack_dns" {
  value = "${data.terraform_remote_state.base.stack_dns}"
}

output "vpc_id" {
  value = "${data.terraform_remote_state.base.vpc_id}"
}

output "vpc_cidr" {
  value = "${data.terraform_remote_state.base.vpc_cidr}"
}

output "stack_region" {
  value = "${data.terraform_remote_state.base.stack_region}"
}

output "account_id" {
  value = "${data.terraform_remote_state.base.account_id}"
}

output "aws_account_profile" {
  value = "${data.terraform_remote_state.base.aws_account_profile}"
}

output "public_domain_zone_id" {
  value = "${data.terraform_remote_state.base.public_domain_zone_id}"
}
# output "public_domain_certificate_arn" {
#   value = "${data.terraform_remote_state.base.public_domain_certificate_arn}"
# }

output "k8s_bucket" {
  value = "${data.terraform_remote_state.base.stack_bucket}${local.k8s_s3_path_suffix}"
}

output "k8s_public_domain_certificate_arn" {
  value = "${data.terraform_remote_state.base.k8s_public_domain_certificate_arn}"
}

output "k8s_private_domain_certificate_arn" {
  value = "${data.terraform_remote_state.base.k8s_private_domain_certificate_arn}"
}
