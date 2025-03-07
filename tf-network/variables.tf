variable "name" {
  description = "Name of the VPC"
  type        = string
  default     = "acmecorp"
}

variable "region" {
  description = "Region"
  type        = string
  default     = "eu-north-1"
}

variable "environment" {
  description = "Environment [dev|staging|qa|prod]"
  type        = string
  default     = "dev"
}

variable "cidr" {
  description = "CIDR range"
  type        = string
  default     = "10.1.0.0/16"
}

variable "private_subnets" {
  type        = list(string)
  description = "Private Subnets"
  default     = ["10.1.4.0/23", "10.1.6.0/23", "10.1.8.0/23"]
}

variable "public_subnets" {
  type        = list(string)
  description = "Public Subnets"
  default     = ["10.1.0.0/24", "10.1.1.0/24", "10.1.2.0/24"]
}

variable "database_subnets" {
  type        = list(string)
  description = "Database Subnets"
  default     = ["10.1.10.0/23", "10.1.18.0/23", "10.1.16.0/23"]
}

variable "create_database_subnet_group" {
  type        = bool
  description = "Flag if should create db subnet group"
  default     = true
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "db_port" {
  description = "RDS Port"
  default     = 3306
  type        = number
}

variable "redis_port" {
  description = "Redis Port"
  default     = 6379
  type        = number
}

variable "acmecorp_access_cidr" {
  description = "ALB CIDR range - This Can be the VPN IP or Company IP for accessing the applications through the ALB"
  type        = string
  default     = "0.0.0.0/0"
}

