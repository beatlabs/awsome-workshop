output "public1_id" {
  value = "${aws_subnet.public1.id}"
}

output "public2_id" {
  value = "${aws_subnet.public2.id}"
}

output "public3_id" {
  value = "${aws_subnet.public3.id}"
}

output "public_route_id" {
  value = "${aws_route_table.public.id}"
}
