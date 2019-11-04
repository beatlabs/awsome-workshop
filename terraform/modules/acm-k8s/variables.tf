variable "stack_name" {}

variable "certificate_name" {
  description = "A distinguised name describing certificate usage"
  default     = ""
}

variable "domain_name" {
  description = "A domain name for which the certificate should be issued"
}

variable "subject_alternative_names" {
  description = "A list of domains that should be SANs in the issued certificate"
  default     = []
}

variable "validate_certificate" {
  description = "Whether to validate certificate by creating Route53 record"
  default     = true
}

variable "validation_allow_overwrite_records" {
  description = "Whether to allow overwrite of Route53 records"
  default     = true
}

variable "wait_for_validation" {
  description = "Whether to wait for the validation to complete"
  default     = false
}

variable "validation_method" {
  description = "Which method to use for validation. DNS or EMAIL are valid, NONE can be used for certificates that were imported into ACM and then into Terraform."
  default     = "DNS"
}

variable "dns_zone_id" {
  description = "The ID of the hosted zone to contain this record."
  default     = ""
}
