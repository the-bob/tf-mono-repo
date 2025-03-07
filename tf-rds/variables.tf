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

variable "instance_class" {
  description = "Database Instance Class"
  type        = string
  default     = "db.t3.micro"
}

variable "storage" {
  description = "Database Storage"
  type        = number
  default     = 20
}

variable "engine" {
  description = "RDS Database Engine to use"
  type        = string
  validation {
    condition     = contains(["mariadb", "postgres", "oracle"], var.engine)
    error_message = "Allowable engine can be maria|postgres|oracle."
  }
  default = "mariadb"
}

variable "engine_version" {
  description = "RDS Database Engine Version"
  type        = string
  default     = "10.6.7"
}

variable "major_engine_version" {
  description = "RDS Database Engine Version"
  type        = string
  default     = "10.6"
}

variable "family" {
  description = "RDS Family"
  type        = string
  validation {
    condition     = can(regex("^(mariadb|postgres|oracle).*?(\\w+)", var.family))
    error_message = "Allowable engine can be maria*|postgres*|oracle*."
  }
  default = "mariadb10.6"
}

variable "username" {
  description = "RDS Master Username"
  type        = string
  default     = "admin"
}

variable "password" {
  description = "RDS Master Password"
  type        = string
  default     = "adminPa55w0rd"
  sensitive   = true
}

variable "port" {
  description = "RDS Port"
  default     = 3306
  type        = number
}