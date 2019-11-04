// The stack placement region
variable "region" {}

variable "vpc_cidr" {}
variable "private_subnet1_cidr" {}
variable "private_subnet2_cidr" {}
variable "private_subnet3_cidr" {}
variable "public_subnet1_cidr" {}
variable "public_subnet2_cidr" {}
variable "public_subnet3_cidr" {}

// The central domain. Used to create the stack's subdomain
variable "global_domain" {}

// The subdomain for stack DNS management
variable "sub_domain" {}

// The name of the stack
variable "stack_name" {}

variable "openvpn_tunnel_net" {}
variable "openvpn_ami" {}

// The private hosted zone for internal dns
variable "private_domain" {
  default = "beat"
}
