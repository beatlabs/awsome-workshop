output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "public_subnet1_id" {
  value = "${module.public_subnet.public1_id}"
}

output "public_subnet2_id" {
  value = "${module.public_subnet.public2_id}"
}

output "public_subnet3_id" {
  value = "${module.public_subnet.public3_id}"
}

output "private_subnet1_id" {
  value = "${module.private_subnet.private1_id}"
}

output "private_subnet2_id" {
  value = "${module.private_subnet.private2_id}"
}

output "private_subnet3_id" {
  value = "${module.private_subnet.private3_id}"
}

output "public_route_id" {
  value = "${module.public_subnet.public_route_id}"
}

output "private1_route_id" {
  value = "${module.private_subnet.private1_route_id}"
}

output "private2_route_id" {
  value = "${module.private_subnet.private2_route_id}"
}

output "private3_route_id" {
  value = "${module.private_subnet.private3_route_id}"
}
