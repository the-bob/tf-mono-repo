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

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource Tags"
}

variable "security_group_names" {
  type        = list(string)
  description = "Security Group Names to be associated"
  default     = []
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet ID Association"
  default     = []
}

variable "domain_name_internal" {
  description = "FQDN for the environment both private hosted zone"
  type        = string
  default     = "internal.dev.acmecorpresearch.com"
}

variable "auth_token" {
  description = "Auth Token"
  sensitive   = true
  type        = string
  default     = "DRO3v7yLwb_10Abs"
}

variable "node_type" {
  description = "Size of the Node"
  type        = string
  default     = "cache.t3.small"
}

variable "engine_version" {
  description = "Redis Engine Version"
  type        = string
  default     = "6.2"
}

variable "parameter_group_name" {
  description = "Redis Param Group Version"
  type        = string
  default     = "default.redis6.x"
}