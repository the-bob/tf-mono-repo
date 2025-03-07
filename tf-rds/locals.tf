locals {
  // Temp doing this but will need to aut-gen
  password = var.password

  name = "${var.name}-${var.environment}"

  tags = {
    Name        = local.name
    Environment = var.environment
  }
}