output "private1_id" {
  value = "${aws_subnet.private1.id}"
}

output "private2_id" {
  value = "${aws_subnet.private2.id}"
}

output "private3_id" {
  value = "${aws_subnet.private3.id}"
}

output "private1_route_id" {
  value = "${aws_route_table.private1.id}"
}

output "private2_route_id" {
  value = "${aws_route_table.private2.id}"
}

output "private3_route_id" {
  value = "${aws_route_table.private3.id}"
}
