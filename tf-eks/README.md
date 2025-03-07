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
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | 18.20.5 |
| <a name="module_eks_iam_policy"></a> [eks\_iam\_policy](#module\_eks\_iam\_policy) | terraform-aws-modules/iam/aws//modules/iam-policy | 4.10.1 |
| <a name="module_iam_assumable_role"></a> [iam\_assumable\_role](#module\_iam\_assumable\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | 4.10.1 |

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_schedule.scale_down](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_schedule) | resource |
| [aws_autoscaling_schedule.scale_up](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_schedule) | resource |
| [aws_iam_policy_document.eks_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [terraform_remote_state.network](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_admin_cidr_block"></a> [additional\_admin\_cidr\_block](#input\_additional\_admin\_cidr\_block) | This is mainly for Runners and Agents to connect to the EKS | `string` | `null` | no |
| <a name="input_admin_cidr_blocks"></a> [admin\_cidr\_blocks](#input\_admin\_cidr\_blocks) | CIDR block for administration of kubernetes | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_ami_type"></a> [ami\_type](#input\_ami\_type) | AMI Type to use | `string` | `"AL2_x86_64"` | no |
| <a name="input_aws_auth_accounts"></a> [aws\_auth\_accounts](#input\_aws\_auth\_accounts) | AWS Accounts That's allowed for EKS | `list(string)` | <pre>[<br>  "418070932336"<br>]</pre> | no |
| <a name="input_aws_auth_users"></a> [aws\_auth\_users](#input\_aws\_auth\_users) | Allowable Auth Users for EKS | <pre>list(object({<br>    userarn  = string<br>    username = string<br>    groups   = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "groups": [<br>      "system:masters",<br>      "system:nodes"<br>    ],<br>    "userarn": "arn:aws:iam::418070932336:user/adelbert",<br>    "username": "adelbert"<br>  }<br>]</pre> | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | EKS Cluster Version | `string` | `"1.22"` | no |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | Desired Size Node | `number` | `2` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment [dev\|staging\|qa\|prod] | `string` | `"dev"` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | Desired Size for the worker nodes | `list(string)` | <pre>[<br>  "t3.medium"<br>]</pre> | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | Max Size Node | `number` | `5` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | Min Size Node | `number` | `2` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the VPC | `string` | `"acmecorp"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region | `string` | `"eu-north-1"` | no |
| <a name="input_scale_down_recurrence"></a> [scale\_down\_recurrence](#input\_scale\_down\_recurrence) | ASG ScaleDown Recurrence | `string` | `"0 20 * * MON-FRI"` | no |
| <a name="input_scale_up_recurrence"></a> [scale\_up\_recurrence](#input\_scale\_up\_recurrence) | ASG ScaleUp Recurrence | `string` | `"0 7 * * MON-FRI"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_time_zone"></a> [time\_zone](#input\_time\_zone) | Timezone | `string` | `"Europe/Dublin"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | Cluster name/id |
| <a name="output_eks_security_groups"></a> [eks\_security\_groups](#output\_eks\_security\_groups) | EKS Managed Nodes Security Groups |
| <a name="output_service_role_iam_arn"></a> [service\_role\_iam\_arn](#output\_service\_role\_iam\_arn) | IAM Service Role For EKS |
<!-- END_TF_DOCS -->