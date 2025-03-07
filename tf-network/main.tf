module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  name = local.name

  cidr                         = var.cidr
  azs                          = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets              = var.private_subnets
  public_subnets               = var.public_subnets
  database_subnets             = var.database_subnets
  enable_ipv6                  = true
  enable_nat_gateway           = true
  single_nat_gateway           = false
  create_database_subnet_group = var.create_database_subnet_group
  enable_dns_hostnames         = true
  enable_dns_support           = true

  tags = merge(var.tags, {
    "kubernetes.io/role/elb"              = "1"
    "kubernetes.io/cluster/${local.name}" = "shared"
  })

  vpc_tags = {
    Name        = local.name
    Environment = var.environment
  }
}

module "loadbalancer_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"

  name   = "${local.name}-www-sg"
  vpc_id = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "Access to the ALB"
      cidr_blocks = var.acmecorp_access_cidr
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "Access to the ALB"
      cidr_blocks = var.acmecorp_access_cidr
    }
  ]
  tags = var.tags
}

module "redis_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"

  name   = "${local.name}-redis-sg"
  vpc_id = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = var.redis_port
      to_port     = var.redis_port
      protocol    = "tcp"
      description = "Redis Access Within the VPC"
      cidr_blocks = var.cidr
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = var.redis_port
      to_port     = var.redis_port
      protocol    = "tcp"
      description = "Redis Access Within the VPC"
      cidr_blocks = var.cidr
    }
  ]
  ingress_with_self = [{
    rule = "all-all"
    }
  ]
}

module "db_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"

  name   = "${local.name}-database-sg"
  vpc_id = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = var.db_port
      to_port     = var.db_port
      protocol    = "tcp"
      description = "RDS Access Within the VPC"
      cidr_blocks = var.cidr
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = var.db_port
      to_port     = var.db_port
      protocol    = "tcp"
      description = "RDS Access Within the VPC"
      cidr_blocks = var.cidr
    }
  ]
  tags = var.tags
}

##### Self Hosted Runners
module "runner_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"

  name   = "${local.name}-runner-security-group"
  vpc_id = module.vpc.vpc_id

  // TODO Make these Variables as we don't know if github rotates these IP's
  // Also Consider changing these via github actions.
  ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "cidr"
      cidr_blocks = var.cidr
    },
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "Egress"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

module "ec2_runner" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.5.0"

  name                   = "${local.name}-runner"
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.small"
  iam_instance_profile   = aws_iam_instance_profile.ec2_ssm_profile.name
  monitoring             = true
  vpc_security_group_ids = [module.runner_security_group.security_group_id, module.db_security_group.security_group_id]
  subnet_id              = module.vpc.private_subnets[0]
  availability_zone      = "${var.region}a"
  user_data_base64       = base64encode(local.userdata)

  root_block_device = [
    {
      delete_on_termination = true,
      volume_size           = 20
    }
  ]

  tags = var.tags
}

resource "aws_iam_instance_profile" "ec2_ssm_profile" {
  name = "${local.name}-ssm-profile"
  role = module.iam_ssm_role.iam_role_name
}

module "iam_ssm_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "4.10.1"

  create_role           = true
  trusted_role_services = ["ec2.amazonaws.com"]
  role_name             = "${local.name}-ssm"
  role_requires_mfa     = false
  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM",
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]
}
