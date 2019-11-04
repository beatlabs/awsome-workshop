resource "aws_internet_gateway" "public" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name      = "${var.stack_name}"
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
    Network   = "Public"
  }
}

resource "aws_subnet" "public1" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.public_subnet1_cidr}"
  availability_zone = "${var.az_region_map["${var.region}.AZ0"]}"

  tags {
    Name      = "${var.stack_name}-public1"
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
    Network   = "Public1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.public_subnet2_cidr}"
  availability_zone = "${var.az_region_map["${var.region}.AZ1"]}"

  tags {
    Name      = "${var.stack_name}-public2"
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
    Network   = "Public2"
  }
}

resource "aws_subnet" "public3" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.public_subnet3_cidr}"
  availability_zone = "${var.az_region_map["${var.region}.AZ2"]}"

  tags {
    Name      = "${var.stack_name}-public3"
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
    Network   = "Public3"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name      = "${var.stack_name}-public"
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
    Network   = "Public"
  }
}

resource "aws_route" "public" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.public.id}"
}

# TODO: change the below to public1, public2, public3
resource "aws_route_table_association" "public-1" {
  subnet_id      = "${aws_subnet.public1.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.public2.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public3" {
  subnet_id      = "${aws_subnet.public3.id}"
  route_table_id = "${aws_route_table.public.id}"
}
