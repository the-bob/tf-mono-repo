module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "3.4.1"

  zone_id     = local.zone_id
  domain_name = local.domain_name

  subject_alternative_names = [
    "*.${local.domain_name}"
  ]

  create_route53_records = true
}