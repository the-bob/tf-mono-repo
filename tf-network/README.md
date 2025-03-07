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
| <a name="module_db_security_group"></a> [db\_security\_group](#module\_db\_security\_group) | terraform-aws-modules/security-group/aws | 4.9.0 |
| <a name="module_ec2_runner"></a> [ec2\_runner](#module\_ec2\_runner) | terraform-aws-modules/ec2-instance/aws | 3.5.0 |
| <a name="module_iam_ssm_role"></a> [iam\_ssm\_role](#module\_iam\_ssm\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | 4.10.1 |
| <a name="module_loadbalancer_security_group"></a> [loadbalancer\_security\_group](#module\_loadbalancer\_security\_group) | terraform-aws-modules/security-group/aws | 4.9.0 |
| <a name="module_redis_security_group"></a> [redis\_security\_group](#module\_redis\_security\_group) | terraform-aws-modules/security-group/aws | 4.9.0 |
| <a name="module_runner_security_group"></a> [runner\_security\_group](#module\_runner\_security\_group) | terraform-aws-modules/security-group/aws | 4.9.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.14.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.ec2_ssm_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_ami.amazon_linux](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr"></a> [cidr](#input\_cidr) | CIDR range | `string` | `"10.1.0.0/16"` | no |
| <a name="input_create_database_subnet_group"></a> [create\_database\_subnet\_group](#input\_create\_database\_subnet\_group) | Flag if should create db subnet group | `bool` | `true` | no |
| <a name="input_database_subnets"></a> [database\_subnets](#input\_database\_subnets) | Database Subnets | `list(string)` | <pre>[<br>  "10.1.10.0/23",<br>  "10.1.18.0/23",<br>  "10.1.16.0/23"<br>]</pre> | no |
| <a name="input_db_port"></a> [db\_port](#input\_db\_port) | RDS Port | `number` | `3306` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment [dev\|staging\|qa\|prod] | `string` | `"dev"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the VPC | `string` | `"acmecorp"` | no |
| <a name="input_acmecorp_access_cidr"></a> [acmecorp\_access\_cidr](#input\_acmecorp\_access\_cidr) | ALB CIDR range - This Can be the VPN IP or Company IP for accessing the applications through the ALB | `string` | `"0.0.0.0/0"` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | Private Subnets | `list(string)` | <pre>[<br>  "10.1.4.0/23",<br>  "10.1.6.0/23",<br>  "10.1.8.0/23"<br>]</pre> | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | Public Subnets | `list(string)` | <pre>[<br>  "10.1.0.0/24",<br>  "10.1.1.0/24",<br>  "10.1.2.0/24"<br>]</pre> | no |
| <a name="input_redis_port"></a> [redis\_port](#input\_redis\_port) | Redis Port | `number` | `6379` | no |
| <a name="input_region"></a> [region](#input\_region) | Region | `string` | `"eu-north-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_cidr"></a> [db\_cidr](#output\_db\_cidr) | DB CIDR |
| <a name="output_db_sg_id"></a> [db\_sg\_id](#output\_db\_sg\_id) | Database Subnet Group ID |
| <a name="output_db_subnet_group"></a> [db\_subnet\_group](#output\_db\_subnet\_group) | DB Subnet Group |
| <a name="output_db_subnets"></a> [db\_subnets](#output\_db\_subnets) | DB Subnet |
| <a name="output_igw_id"></a> [igw\_id](#output\_igw\_id) | Internet Gateway ID |
| <a name="output_loadbalancer_sg_id"></a> [loadbalancer\_sg\_id](#output\_loadbalancer\_sg\_id) | ALB Subnet Group ID |
| <a name="output_private_cidr"></a> [private\_cidr](#output\_private\_cidr) | The Private CIDR of the VPC |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | Private Subnet |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | Public Subnet |
| <a name="output_redis_sg_id"></a> [redis\_sg\_id](#output\_redis\_sg\_id) | Redis Subnet Group ID |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | VPC CIDR |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC ID |
<!-- END_TF_DOCS -->