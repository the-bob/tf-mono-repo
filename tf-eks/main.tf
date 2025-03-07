module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.20.5"

  vpc_id     = data.terraform_remote_state.network.outputs.vpc_id
  subnet_ids = data.terraform_remote_state.network.outputs.private_subnets

  cluster_name                         = local.name
  cluster_version                      = var.cluster_version
  cluster_endpoint_private_access      = true
  cluster_endpoint_public_access       = true
  cluster_endpoint_public_access_cidrs = var.additional_admin_cidr_block != null ? concat(var.admin_cidr_blocks, [var.additional_admin_cidr_block]) : var.admin_cidr_blocks

  manage_aws_auth_configmap = true
  create_aws_auth_configmap = true

  aws_auth_users    = var.aws_auth_users
  aws_auth_accounts = var.aws_auth_accounts

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {

    }
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  node_security_group_additional_rules = {
    ingress_allow_access_from_control_plane = {
      type                          = "ingress"
      protocol                      = "tcp"
      from_port                     = 9443
      to_port                       = 9443
      source_cluster_security_group = true
      description                   = "Allow access from control plane to webhook port of AWS load balancer controller"
    }
    ingress_allow_node_ports = {
      type                          = "ingress"
      protocol                      = "tcp"
      from_port                     = 30000
      to_port                       = 32767
      source_cluster_security_group = true
      description                   = "Allow Access from ALB"
    }
    private_ingress_vpc = {
      description = "Node Ingress Access within the VPC"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      type        = "ingress"
      cidr_blocks = data.terraform_remote_state.network.outputs.private_cidr
    }
  }

  cluster_security_group_additional_rules = {
    private_ingress_9443 = {
      description = "Node Ingress Access within the VPC"
      protocol    = "tcp"
      from_port   = 9443
      to_port     = 9443
      type        = "ingress"
      cidr_blocks = data.terraform_remote_state.network.outputs.private_cidr
    }
    private_ingress_vpc = {
      description = "Node Ingress Access within the VPC"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      type        = "ingress"
      cidr_blocks = data.terraform_remote_state.network.outputs.private_cidr
    }
    egress_all = {
      description      = "Egress All"
      protocol         = "-1"
      from_port        = 0
      to_port          = 0
      type             = "egress"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  enable_irsa = true

  eks_managed_node_group_defaults = {
    ami_type               = var.ami_type
    disk_size              = 50
    vpc_security_group_ids = [data.terraform_remote_state.network.outputs.db_sg_id]
    pre_userdata           = <<-EOT
cd /tmp
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl enable-amazon-ssm-agent
sudo systemctl start amazon-ssm-agent
      EOT
  }

  eks_managed_node_groups = {
    worker_nodes = {
      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size

      instance_types = var.instance_types
      capacity_type  = "ON_DEMAND"
      labels = {
        Environment = local.name
      }

      update_config = {
        max_unavailable_percentage = 50
      }

      security_group_rules = {
        egress = {
          description = ""
          protocol    = "-1"
          from_port   = 0
          to_port     = 0
          type        = "egress"
          cidr_blocks = [data.terraform_remote_state.network.outputs.vpc_cidr]
        }
        ingress = {
          description = ""
          protocol    = "-1"
          from_port   = 0
          to_port     = 0
          type        = "ingress"
          cidr_blocks = [data.terraform_remote_state.network.outputs.vpc_cidr]
        }
      }
      tags = {
        ManagedNodeGroups = true
      }

      iam_role_additional_policies = [
        "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM",
        "arn:aws:iam::aws:policy/ElasticLoadBalancingFullAccess"
      ]
    }
  }

  tags = local.tags
}

module "iam_assumable_role" {
  source      = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version     = "4.10.1"
  create_role = true

  role_name                      = "${local.name}-role-with-oidc"
  oidc_fully_qualified_subjects  = ["system:serviceaccount:kube-system:${local.name}-alb-controller"]
  oidc_fully_qualified_audiences = ["sts.amazonaws.com"]
  provider_url                   = module.eks.oidc_provider

  role_policy_arns = [
    module.eks_iam_policy.arn,
  ]
  number_of_role_policy_arns = 1
}

module "eks_iam_policy" {
  source        = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version       = "4.10.1"
  name          = "${local.name}-alb-controller-iam-policy"
  policy        = data.aws_iam_policy_document.eks_iam_policy.json
  create_policy = true

}

resource "aws_autoscaling_schedule" "scale_up" {
  scheduled_action_name  = "ScaleUp"
  min_size               = var.min_size
  max_size               = var.max_size
  desired_capacity       = var.desired_size
  recurrence             = var.scale_up_recurrence
  time_zone              = var.time_zone
  autoscaling_group_name = module.eks.eks_managed_node_groups_autoscaling_group_names[0]
  depends_on = [
    module.eks
  ]
}

resource "aws_autoscaling_schedule" "scale_down" {
  scheduled_action_name  = "ScaleDown"
  min_size               = 0
  max_size               = 0
  desired_capacity       = 0
  recurrence             = var.scale_down_recurrence
  time_zone              = var.time_zone
  autoscaling_group_name = module.eks.eks_managed_node_groups_autoscaling_group_names[0]
  depends_on = [
    module.eks
  ]
}