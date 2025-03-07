output "target_group_arns" {
  value       = module.alb.target_group_arns
  description = "Target Group ARN to use"
}

output "target_group_names" {
  value       = module.alb.target_group_names
  description = "ALB TargetGroup Names"
}

output "lb_dns_name" {
  value       = module.alb.lb_dns_name
  description = "ALB DNS Name"
}

output "lb_zone_id" {
  value       = module.alb.lb_zone_id
  description = "ALB Zone ID"
}