locals {
  name = "${var.name}-${var.environment}"

  tags = {
    Name        = local.name
    Environment = var.environment
  }
}