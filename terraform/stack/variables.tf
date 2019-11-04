# stack
variable "aws_account_profile" {}

#variable "production_market" {}
variable "beat_region" {}

variable "global_domain" {}
variable "openvpn_tunnel_net" {}
variable "openvpn_ami" {}
variable "private_domain" {}
variable "private_subnet1_cidr" {}
variable "private_subnet2_cidr" {}
variable "private_subnet3_cidr" {}
variable "public_subnet1_cidr" {}
variable "public_subnet2_cidr" {}
variable "public_subnet3_cidr" {}
variable "region" {}
variable "stack_name" {}

# In all markets this will be the same as stack_name, with the exception of
# greece and staging where this will be lower(stack_name)-vpc
variable "aws_stack_name" {}

variable "sub_domain" {}
variable "vpc_cidr" {}

variable "kubernetes_subdomain" {}
