resource "aws_eip" "nat_gateway_eip1" {
  vpc = true

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name      = "${var.stack_name}-nat-gateway1"
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
  }
}

resource "aws_eip" "nat_gateway_eip2" {
  vpc = true

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name      = "${var.stack_name}-nat-gateway2"
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
  }
}

resource "aws_eip" "nat_gateway_eip3" {
  vpc = true

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name      = "${var.stack_name}-nat-gateway3"
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
  }
}

resource "aws_nat_gateway" "nat1" {
  allocation_id = "${aws_eip.nat_gateway_eip1.id}"
  subnet_id     = "${var.public_subnet1_id}"

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name      = "${var.stack_name}-1"
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
  }
}

resource "aws_nat_gateway" "nat2" {
  allocation_id = "${aws_eip.nat_gateway_eip2.id}"
  subnet_id     = "${var.public_subnet2_id}"

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name      = "${var.stack_name}-2"
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
  }
}

resource "aws_nat_gateway" "nat3" {
  allocation_id = "${aws_eip.nat_gateway_eip3.id}"
  subnet_id     = "${var.public_subnet3_id}"

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name      = "${var.stack_name}-3"
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
  }
}
