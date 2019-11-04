resource "aws_subnet" "private1" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.private_subnet1_cidr}"
  availability_zone = "${var.az_region_map["${var.region}.AZ0"]}"

  tags {
    Name      = "${var.stack_name}-private1"
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
    Network   = "Private1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.private_subnet2_cidr}"
  availability_zone = "${var.az_region_map["${var.region}.AZ1"]}"

  tags {
    Name      = "${var.stack_name}-private2"
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
    Network   = "Private2"
  }
}

resource "aws_subnet" "private3" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.private_subnet3_cidr}"
  availability_zone = "${var.az_region_map["${var.region}.AZ2"]}"

  tags {
    Name      = "${var.stack_name}-private3"
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
    Network   = "Private3"
  }
}

resource "aws_route_table" "private1" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name      = "${var.stack_name}-private1"
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
    Network   = "Private"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route" "private1" {
  route_table_id         = "${aws_route_table.private1.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${var.nat_gateway1_id}"
}

resource "aws_route_table" "private2" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name      = "${var.stack_name}-private2"
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
    Network   = "Private"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route" "private2" {
  route_table_id         = "${aws_route_table.private2.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${var.nat_gateway2_id}"
}

resource "aws_route_table" "private3" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name      = "${var.stack_name}-private3"
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
    Network   = "Private"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route" "private3" {
  route_table_id         = "${aws_route_table.private3.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${var.nat_gateway3_id}"
}

resource "aws_route_table_association" "private1" {
  subnet_id      = "${aws_subnet.private1.id}"
  route_table_id = "${aws_route_table.private1.id}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table_association" "private2" {
  subnet_id      = "${aws_subnet.private2.id}"
  route_table_id = "${aws_route_table.private2.id}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table_association" "private3" {
  subnet_id      = "${aws_subnet.private3.id}"
  route_table_id = "${aws_route_table.private3.id}"

  lifecycle {
    create_before_destroy = true
  }
}
