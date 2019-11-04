resource "aws_s3_bucket" "stack_s3_bucket" {
  bucket = "${var.stack_bucket}"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags {
    Stack     = "${var.stack_name}"
    ManagedBy = "Terraform"
  }
}
