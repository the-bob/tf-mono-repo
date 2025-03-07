module "hosted_zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "2.6.0"

  zones = {
    "${local.external_domain}" = {
      domain_name = local.external_domain
      tags = {
        Name = local.external_domain
      }
    }
    "${local.internal_domain}" = {
      domain_name = local.internal_domain
      vpc = [
        {
          vpc_id = data.terraform_remote_state.network.outputs.vpc_id
        }
      ]
      tags = {
        Name = local.internal_domain
      }
    }
  }

  tags = var.tags
}