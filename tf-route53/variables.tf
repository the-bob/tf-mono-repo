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
  description = "FQDN for the environment both public private hosted zone"
  type        = string
  default     = "dev.acmecorpresearch.com"
}
