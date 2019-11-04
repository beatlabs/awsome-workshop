## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| caller\_id |  | string | n/a | yes |
| global\_domain |  | string | n/a | yes |
| kubernetes\_subdomain |  | string | n/a | yes |
| kubernetes\_worker\_principal |  | string | n/a | yes |
| public\_domain\_zone\_id |  | string | n/a | yes |
| stack\_name |  | string | n/a | yes |
| sub\_domain |  | string | n/a | yes |
| taxibeat\_legacy\_cert | Operator to enable/disable taxibeat.com certificate approval | string | `"true"` | no |
| velero\_bucket |  | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| k8s\_private\_domain\_certificate\_arn |  |
| k8s\_private\_domain\_certificate\_id |  |
| k8s\_public\_domain\_certificate\_arn |  |
| k8s\_public\_domain\_certificate\_id |  |
| k8s\_public\_fullchain\_domain\_certificate\_arn |  |
| k8s\_public\_fullchain\_domain\_certificate\_id |  |
| velero\_kube2iam\_iam\_role |  |
| velero\_s3\_bucket |  |

