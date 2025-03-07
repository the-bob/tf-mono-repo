locals {
  external_domain = var.domain_name
  internal_domain = format("internal.%s", var.domain_name)
}