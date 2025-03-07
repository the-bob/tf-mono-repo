output "eks_security_groups" {
  value = flatten([
    for node in module.eks.eks_managed_node_groups :
    node.security_group_id
  ])
  description = "EKS Managed Nodes Security Groups"
}

output "service_role_iam_arn" {
  description = "IAM Service Role For EKS"
  value       = module.iam_assumable_role.iam_role_arn
}

output "cluster_id" {
  description = "Cluster name/id"
  value       = module.eks.cluster_id
}