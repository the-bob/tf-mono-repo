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

variable "host_headers" {
  description = "DNS Names For Host Headers"
  type        = set(string)
  default     = ["*.dev.acmecorpresearch.com"]
}
