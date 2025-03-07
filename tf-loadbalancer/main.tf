module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "6.4.0"

  name               = local.name
  load_balancer_type = "application"

  vpc_id          = data.terraform_remote_state.network.outputs.vpc_id
  security_groups = concat(data.terraform_remote_state.eks.outputs.eks_security_groups, [data.terraform_remote_state.network.outputs.loadbalancer_sg_id])
  subnets         = data.terraform_remote_state.network.outputs.public_subnets

  // Can be Private or Public
  internal = false

  target_groups = [
    {
      name_prefix          = "eks"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "ip"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
    }
  ]
  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = data.terraform_remote_state.acm.outputs.acm_certificate_arn
      target_group_index = 0
      fixed_response = {
        content_type = "text/plain"
        message_body = "Fixed message"
        status_code  = "200"
      }
    }
  ]
  https_listener_rules = [
    {
      https_listener_index = 0
      actions = [
        {
          type               = "forward"
          target_group_index = 0
        }
      ]
      conditions = [
        {
          host_headers = var.host_headers
        }
      ]
    }
  ]
  tags = local.tags
}
