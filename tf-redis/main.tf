resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = "${var.name}-redis-subnet"
  subnet_ids = data.terraform_remote_state.network.outputs.private_subnets
}

resource "aws_elasticache_replication_group" "redis" {
  automatic_failover_enabled = true
  # at_rest_encryption_enabled = true
  # transit_encryption_enabled = true

  preferred_cache_cluster_azs = local.availability_zones

  replication_group_id = "${local.name}-replication-1"
  description          = "acmecorp Redis Elasticache"

  node_type            = var.node_type
  engine_version       = var.engine_version
  parameter_group_name = var.parameter_group_name
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.redis_subnet_group.name
  security_group_ids   = [data.terraform_remote_state.network.outputs.redis_sg_id]

  num_cache_clusters = local.num_cache_clusters
  user_group_ids     = []
  # auth_token = var.auth_token

  lifecycle {
    ignore_changes = [number_cache_clusters]
  }

  tags = local.tags
}

