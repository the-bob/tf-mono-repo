module "database" {
  source  = "terraform-aws-modules/rds/aws"
  version = "4.2.0"

  identifier = local.name

  engine               = var.engine
  engine_version       = var.engine_version
  family               = var.family
  major_engine_version = var.major_engine_version
  instance_class       = var.instance_class

  allocated_storage     = var.storage
  max_allocated_storage = 100

  username = var.username
  password = var.password
  port     = var.port

  db_subnet_group_name   = data.terraform_remote_state.network.outputs.db_subnet_group
  subnet_ids             = data.terraform_remote_state.network.outputs.db_subnets
  vpc_security_group_ids = [data.terraform_remote_state.network.outputs.db_sg_id]

  create_cloudwatch_log_group = true

  tags = local.tags
}