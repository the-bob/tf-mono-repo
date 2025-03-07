<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.8 |
| <a name="requirement_mysql"></a> [mysql](#requirement\_mysql) | >= 1.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_mysql"></a> [mysql](#provider\_mysql) | >= 1.9.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [mysql_database.database](https://registry.terraform.io/providers/terraform-providers/mysql/latest/docs/resources/database) | resource |
| [mysql_grant.database](https://registry.terraform.io/providers/terraform-providers/mysql/latest/docs/resources/grant) | resource |
| [mysql_user.database](https://registry.terraform.io/providers/terraform-providers/mysql/latest/docs/resources/user) | resource |
| [terraform_remote_state.database](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_mysql_database"></a> [mysql\_database](#input\_mysql\_database) | Initial Databases to be initialised | `string` | `"acmecorp"` | no |
| <a name="input_mysql_database_user"></a> [mysql\_database\_user](#input\_mysql\_database\_user) | Initial Database User to be initialised | `string` | `"acmecorp"` | no |
| <a name="input_mysql_default_character_set"></a> [mysql\_default\_character\_set](#input\_mysql\_default\_character\_set) | default Character set to be used for the database schema | `string` | `"utf8"` | no |
| <a name="input_mysql_default_collation"></a> [mysql\_default\_collation](#input\_mysql\_default\_collation) | default collation set to be used for the database schema | `string` | `"utf8_unicode_ci"` | no |
| <a name="input_password"></a> [password](#input\_password) | Temp Database password | `string` | `"adminpassword"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->