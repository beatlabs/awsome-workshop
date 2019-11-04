## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| certificate\_name | A distinguised name describing certificate usage | string | `""` | no |
| dns\_zone\_id | The ID of the hosted zone to contain this record. | string | `""` | no |
| domain\_name | A domain name for which the certificate should be issued | string | n/a | yes |
| legacy\_dns\_zone\_id | The ID of the legacy hosted zone to contain this record. | string | `"Z1H4H1LG26ZJL3"` | no |
| stack\_name |  | string | n/a | yes |
| subject\_alternative\_names | A list of domains that should be SANs in the issued certificate | list | `<list>` | no |
| validate\_certificate | Whether to validate certificate by creating Route53 record | string | `"true"` | no |
| validation\_allow\_overwrite\_records | Whether to allow overwrite of Route53 records | string | `"true"` | no |
| validation\_method | Which method to use for validation. DNS or EMAIL are valid, NONE can be used for certificates that were imported into ACM and then into Terraform. | string | `"DNS"` | no |
| wait\_for\_validation | Whether to wait for the validation to complete | string | `"false"` | no |

## Outputs

| Name | Description |
|------|-------------|
| certificate\_arn |  |
| certificate\_id |  |

