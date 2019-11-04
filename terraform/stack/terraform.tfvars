# stack variables
aws_account_profile   = "beat_testing"
beat_region           = "tat"
region                = "eu-west-1"
stack_name            = "Tatooine"
aws_stack_name        = "tatooine"

# DNS
global_domain         = "thebeat.co"
private_domain        = "tatooine"
sub_domain            = "tatooine"


# VPN
openvpn_tunnel_net    = "10.35.0.0"
openvpn_ami           = "amzn-ami-vpc-nat-hvm-2018.03.0.20180811-x86_64-ebs"

# Network
vpc_cidr              = "10.34.0.0/16"
private_subnet1_cidr  = "10.34.3.0/24"
private_subnet2_cidr  = "10.34.4.0/24"
private_subnet3_cidr  = "10.34.5.0/24"
public_subnet1_cidr   = "10.34.0.0/24"
public_subnet2_cidr   = "10.34.1.0/24"
public_subnet3_cidr   = "10.34.2.0/24"
management_vpc_access = true

kubernetes_subdomain = "k8s"
