<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.8 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.4.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb_load_balancer_controller"></a> [alb\_load\_balancer\_controller](#module\_alb\_load\_balancer\_controller) | terraform-module/release/helm | 2.7.0 |
| <a name="module_argocd"></a> [argocd](#module\_argocd) | terraform-module/release/helm | 2.7.0 |
| <a name="module_aws_eks_service_account"></a> [aws\_eks\_service\_account](#module\_aws\_eks\_service\_account) | terraform-module/release/helm | 2.7.0 |
| <a name="module_ingress-nginx"></a> [ingress-nginx](#module\_ingress-nginx) | terraform-module/release/helm | 2.7.0 |
| <a name="module_target_group_binding"></a> [target\_group\_binding](#module\_target\_group\_binding) | terraform-module/release/helm | 2.7.0 |

## Resources

| Name | Type |
|------|------|
| [null_resource.wait_for_alb_controller](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [terraform_remote_state.eks](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.loadbalancer](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.route53_records](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment [dev\|staging\|qa\|prod] | `string` | `"dev"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the VPC | `string` | `"acmecorp"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region | `string` | `"eu-north-1"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->