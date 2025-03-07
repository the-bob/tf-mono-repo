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

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource Tags"
}

variable "domain_name" {
  description = "FQDN for the environment both public hosted zone"
  type        = string
  default     = "dev.acmecorpresearch.com"
}

variable "domain_name_internal" {
  description = "FQDN for the environment both private hosted zone"
  type        = string
  default     = "internal.dev.acmecorpresearch.com"
}

variable "apps" {
  description = "The Sub Domains to be added"
  type        = set(string)
  default     = ["app", "deployment", "api"]
}
