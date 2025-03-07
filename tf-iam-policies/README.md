<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.1.10 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.1.10 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_policy_ecr_push"></a> [iam\_policy\_ecr\_push](#module\_iam\_policy\_ecr\_push) | terraform-aws-modules/iam/aws//modules/iam-policy | 4.20.1 |
| <a name="module_iam_policy_tf"></a> [iam\_policy\_tf](#module\_iam\_policy\_tf) | terraform-aws-modules/iam/aws//modules/iam-policy | 4.20.1 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy_document.iam_ecr_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.iam_tf_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_ecr_arn"></a> [iam\_ecr\_arn](#output\_iam\_ecr\_arn) | The ARN assigned by AWS to this policy ECR |
| <a name="output_iam_ecr_id"></a> [iam\_ecr\_id](#output\_iam\_ecr\_id) | The policy's ID ECR |
| <a name="output_iam_ecr_name"></a> [iam\_ecr\_name](#output\_iam\_ecr\_name) | The name of the policy ECR |
| <a name="output_iam_tf_arn"></a> [iam\_tf\_arn](#output\_iam\_tf\_arn) | The ARN assigned by AWS to this policy Terraform |
| <a name="output_iam_tf_id"></a> [iam\_tf\_id](#output\_iam\_tf\_id) | The policy's ID Terraform |
| <a name="output_iam_tf_name"></a> [iam\_tf\_name](#output\_iam\_tf\_name) | The name of the policy Terraform |
<!-- END_TF_DOCS -->