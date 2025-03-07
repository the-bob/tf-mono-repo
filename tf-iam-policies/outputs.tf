output "iam_ecr_id" {
  description = "The policy's ID ECR"
  value       = module.iam_policy_ecr_push.id
}

output "iam_ecr_arn" {
  description = "The ARN assigned by AWS to this policy ECR"
  value       = module.iam_policy_ecr_push.arn
}

output "iam_ecr_name" {
  description = "The name of the policy ECR"
  value       = module.iam_policy_ecr_push.name
}

output "iam_tf_id" {
  description = "The policy's ID Terraform"
  value       = module.iam_policy_tf.id
}

output "iam_tf_arn" {
  description = "The ARN assigned by AWS to this policy Terraform"
  value       = module.iam_policy_tf.arn
}

output "iam_tf_name" {
  description = "The name of the policy Terraform"
  value       = module.iam_policy_tf.name
}