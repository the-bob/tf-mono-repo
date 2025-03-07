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

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_replication_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [aws_elasticache_subnet_group.redis_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [terraform_remote_state.network](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auth_token"></a> [auth\_token](#input\_auth\_token) | Auth Token | `string` | `"DRO3v7yLwb_10Abs"` | no |
| <a name="input_domain_name_internal"></a> [domain\_name\_internal](#input\_domain\_name\_internal) | FQDN for the environment both private hosted zone | `string` | `"internal.dev.acmecorpresearch.com"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Redis Engine Version | `string` | `"6.2"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment [dev\|staging\|qa\|prod] | `string` | `"dev"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the VPC | `string` | `"acmecorp"` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | Size of the Node | `string` | `"cache.t3.small"` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | Redis Param Group Version | `string` | `"default.redis6.x"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region | `string` | `"eu-north-1"` | no |
| <a name="input_security_group_names"></a> [security\_group\_names](#input\_security\_group\_names) | Security Group Names to be associated | `list(string)` | `[]` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Subnet ID Association | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource Tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_redis_endpoint"></a> [redis\_endpoint](#output\_redis\_endpoint) | Redis Cache endpoint |
<!-- END_TF_DOCS -->