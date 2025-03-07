variable "mysql_database" {
  description = "Initial Databases to be initialised"
  default     = "acmecorp"
  type        = string
}

variable "mysql_default_character_set" {
  description = "default Character set to be used for the database schema"
  default     = "utf8"
  type        = string
}

variable "mysql_default_collation" {
  description = "default collation set to be used for the database schema"
  default     = "utf8_unicode_ci"
  type        = string
}

variable "mysql_database_user" {
  description = "Initial Database User to be initialised"
  default     = "acmecorp"
  type        = string
}

variable "password" {
  description = "Temp Database password"
  type        = string
  default     = "adminpassword"
  sensitive   = true
}