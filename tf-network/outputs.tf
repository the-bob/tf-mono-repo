output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "igw_id" {
  description = "Internet Gateway ID"
  value       = module.vpc.igw_id
}

output "db_sg_id" {
  description = "Database Subnet Group ID"
  value       = module.db_security_group.security_group_id
}

output "redis_sg_id" {
  description = "Redis Subnet Group ID"
  value       = module.redis_security_group.security_group_id
}

output "loadbalancer_sg_id" {
  description = "ALB Subnet Group ID"
  value       = module.loadbalancer_security_group.security_group_id
}

output "public_subnets" {
  description = "Public Subnet"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "Private Subnet"
  value       = module.vpc.private_subnets
}

output "db_subnet_group" {
  description = "DB Subnet Group"
  value       = module.vpc.database_subnet_group
}

output "db_cidr" {
  description = "DB CIDR"
  value       = module.vpc.database_subnets_cidr_blocks
}

output "db_subnets" {
  description = "DB Subnet"
  value       = module.vpc.database_subnets
}

output "vpc_cidr" {
  description = "VPC CIDR"
  value       = var.cidr
}

output "private_cidr" {
  description = "The Private CIDR of the VPC"
  value       = var.private_subnets
}