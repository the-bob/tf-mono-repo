<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.1.10 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_database_internal_dns"></a> [database\_internal\_dns](#module\_database\_internal\_dns) | terraform-aws-modules/route53/aws//modules/records | 2.5.0 |
| <a name="module_dns_records"></a> [dns\_records](#module\_dns\_records) | terraform-aws-modules/route53/aws//modules/records | 2.5.0 |
| <a name="module_redis_internal_dns"></a> [redis\_internal\_dns](#module\_redis\_internal\_dns) | terraform-aws-modules/route53/aws//modules/records | 2.5.0 |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.database](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.loadbalancer](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.redis](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.route53](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apps"></a> [apps](#input\_apps) | The Sub Domains to be added | `set(string)` | <pre>[<br>  "app",<br>  "deployment",<br>  "api"<br>]</pre> | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | FQDN for the environment both public hosted zone | `string` | `"dev.acmecorpresearch.com"` | no |
| <a name="input_domain_name_internal"></a> [domain\_name\_internal](#input\_domain\_name\_internal) | FQDN for the environment both private hosted zone | `string` | `"internal.dev.acmecorpresearch.com"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the VPC | `string` | `"acmecorp"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region | `string` | `"eu-north-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource Tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domain_name"></a> [domain\_name](#output\_domain\_name) | Domain Name Defined |
<!-- END_TF_DOCS -->