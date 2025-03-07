locals {
  domain_name = data.terraform_remote_state.route53.outputs.domain_name
  zone_id     = lookup(data.terraform_remote_state.route53.outputs.zone_id, data.terraform_remote_state.route53.outputs.domain_name, "dev.acmecorpresearch.com")
}