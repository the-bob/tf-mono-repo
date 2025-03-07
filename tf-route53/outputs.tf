output "zone_name" {
  description = "Zone Name"
  value       = module.hosted_zones.route53_zone_name
}

output "zone_id" {
  description = "Zone ID"
  value       = module.hosted_zones.route53_zone_zone_id
}

output "name_servers" {
  description = "Zone Name Servers"
  value       = module.hosted_zones.route53_zone_name_servers
}

output "domain_name" {
  description = "Domain Name Defined"
  value       = var.domain_name
}