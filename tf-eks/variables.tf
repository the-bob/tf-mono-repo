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
  type    = map(string)
  default = {}
}

variable "ami_type" {
  description = "AMI Type to use"
  type        = string
  default     = "AL2_x86_64"
}

variable "cluster_version" {
  description = "EKS Cluster Version"
  type        = string
  default     = "1.22"
}

variable "admin_cidr_blocks" {
  description = "CIDR block for administration of kubernetes"
  type        = list(string)
  default = [
    "0.0.0.0/0" // TMP
  ]
}

variable "additional_admin_cidr_block" {
  description = "This is mainly for Runners and Agents to connect to the EKS"
  type        = string
  default     = null
}

variable "aws_auth_users" {
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
  description = "Allowable Auth Users for EKS"
  default = [
    {
      userarn  = "arn:aws:iam::418070932336:user/adelbert"
      username = "adelbert"
      groups   = ["system:masters", "system:nodes"]
    }
  ]
}

variable "aws_auth_accounts" {
  description = "AWS Accounts That's allowed for EKS"
  type        = list(string)
  default     = ["418070932336"]
}

variable "min_size" {
  description = "Min Size Node"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Max Size Node"
  type        = number
  default     = 5
}

variable "desired_size" {
  description = "Desired Size Node"
  type        = number
  default     = 2
}

variable "scale_up_recurrence" {
  description = "ASG ScaleUp Recurrence"
  type        = string
  default     = "0 7 * * MON-FRI"
}

variable "scale_down_recurrence" {
  description = "ASG ScaleDown Recurrence"
  type        = string
  default     = "0 20 * * MON-FRI"
}

variable "time_zone" {
  description = "Timezone"
  type        = string
  default     = "Europe/Dublin"
}

variable "instance_types" {
  description = "Desired Size for the worker nodes"
  type        = list(string)
  default     = ["t3.medium"]
}