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
| <a name="module_database"></a> [database](#module\_database) | terraform-aws-modules/rds/aws | 4.2.0 |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.network](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_engine"></a> [engine](#input\_engine) | RDS Database Engine to use | `string` | `"mariadb"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | RDS Database Engine Version | `string` | `"10.6.7"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment [dev\|staging\|qa\|prod] | `string` | `"dev"` | no |
| <a name="input_family"></a> [family](#input\_family) | RDS Family | `string` | `"mariadb10.6"` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | Database Instance Class | `string` | `"db.t3.micro"` | no |
| <a name="input_major_engine_version"></a> [major\_engine\_version](#input\_major\_engine\_version) | RDS Database Engine Version | `string` | `"10.6"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the VPC | `string` | `"acmecorp"` | no |
| <a name="input_password"></a> [password](#input\_password) | RDS Master Password | `string` | `"adminPa55w0rd"` | no |
| <a name="input_port"></a> [port](#input\_port) | RDS Port | `number` | `3306` | no |
| <a name="input_region"></a> [region](#input\_region) | Region | `string` | `"eu-north-1"` | no |
| <a name="input_storage"></a> [storage](#input\_storage) | Database Storage | `number` | `20` | no |
| <a name="input_username"></a> [username](#input\_username) | RDS Master Username | `string` | `"admin"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_instance_address"></a> [db\_instance\_address](#output\_db\_instance\_address) | DB Instance Address |
| <a name="output_db_instance_password"></a> [db\_instance\_password](#output\_db\_instance\_password) | DB Instance Password |
| <a name="output_db_instance_username"></a> [db\_instance\_username](#output\_db\_instance\_username) | DB Instance Username |
<!-- END_TF_DOCS -->