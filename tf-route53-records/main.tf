
module "dns_records" {
  for_each  = var.apps
  source    = "terraform-aws-modules/route53/aws//modules/records"
  version   = "2.5.0"
  zone_name = var.domain_name
  records = [
    {
      name = each.value
      type = "A"
      alias = {
        name    = data.terraform_remote_state.loadbalancer.outputs.lb_dns_name
        zone_id = data.terraform_remote_state.loadbalancer.outputs.lb_zone_id
      }
    }
  ]
}

module "database_internal_dns" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "2.5.0"
  zone_id = values(data.terraform_remote_state.route53.outputs.zone_id)[1]
  records = [
    {
      name = "database"
      type = "CNAME"
      ttl  = 60
      records = [
        "${data.terraform_remote_state.database.outputs.db_instance_address}"
      ]
      set_identifier = "database-internal-dns"
      weighted_routing_policy = {
        weight = 90
      }
    }
  ]
}

module "redis_internal_dns" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "2.5.0"
  zone_id = values(data.terraform_remote_state.route53.outputs.zone_id)[1]
  records = [
    {
      name = "redis"
      type = "CNAME"
      ttl  = 60
      records = [
        "${data.terraform_remote_state.redis.outputs.redis_endpoint}"
      ]
      set_identifier = "redis-internal-dns"
      weighted_routing_policy = {
        weight = 90
      }
    }
  ]
}