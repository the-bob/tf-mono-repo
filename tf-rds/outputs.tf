output "db_instance_address" {
  value       = module.database.db_instance_address
  description = "DB Instance Address"
}

output "db_instance_password" {
  value       = module.database.db_instance_password
  description = "DB Instance Password"
  sensitive   = true
}

output "db_instance_username" {
  value       = module.database.db_instance_username
  description = "DB Instance Username"
  sensitive   = true
}


