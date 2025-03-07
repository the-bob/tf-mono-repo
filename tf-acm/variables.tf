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
