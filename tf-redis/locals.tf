locals {
  availability_zones = ["${var.region}a", "${var.region}b", "${var.region}c"]
  num_cache_clusters = length(local.availability_zones)

  name = "${var.name}-${var.environment}"

  tags = {
    Name        = local.name
    Environment = var.environment
  }
}