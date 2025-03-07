module "alb_load_balancer_controller" {
  source  = "terraform-module/release/helm"
  version = "2.7.0"

  namespace  = "kube-system"
  repository = "https://aws.github.io/eks-charts"

  app = {
    name          = local.service_account
    version       = "1.4.0"
    chart         = "aws-load-balancer-controller"
    force_update  = true
    wait          = false
    recreate_pods = true
    force_update  = true
    deploy        = 1
  }
  set = [
    {
      name  = "serviceAccount.name"
      value = local.service_account
    },
    {
      name  = "serviceAccount.create"
      value = "false"
    },
    {
      name  = "clusterName"
      value = data.terraform_remote_state.eks.outputs.cluster_id
    }
  ]
}

module "ingress-nginx" {
  source  = "terraform-module/release/helm"
  version = "2.7.0"

  namespace  = "default"
  repository = "https://kubernetes.github.io/ingress-nginx"

  app = {
    name          = "ingress-nginx"
    version       = "4.0.18"
    chart         = "ingress-nginx"
    force_update  = true
    wait          = false
    recreate_pods = true
    force_update  = true
    deploy        = 1
  }

  values = [templatefile("charts/ingress-nginx/ingress-nginx.yml", {})]
}

module "aws_eks_service_account" {
  source  = "terraform-module/release/helm"
  version = "2.7.0"

  namespace  = "kube-system"
  repository = "https://acmecorp.github.io/docker-helm/"

  app = {
    name          = "acmecorp-eks-service-account"
    version       = "0.1.0"
    chart         = "service-account"
    force_update  = true
    wait          = false
    recreate_pods = true
    force_update  = true
    deploy        = 1
  }
  set = [
    {
      name  = "serviceAccount.namespace"
      value = "kube-system"
    },
    {
      name  = "serviceAccount.create"
      value = "true"
    },
    {
      name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role\\-arn"
      value = data.terraform_remote_state.eks.outputs.service_role_iam_arn
    },
    {
      name  = "serviceAccount.name"
      value = local.service_account
    }
  ]
}

resource "null_resource" "wait_for_alb_controller" {
  depends_on = [
    module.alb_load_balancer_controller
  ]
  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command     = "sleep 300"
  }
}

module "target_group_binding" {
  source  = "terraform-module/release/helm"
  version = "2.7.0"

  namespace  = "default"
  repository = "https://acmecorp.github.io/docker-helm/"

  app = {
    name          = "acmecorp-eks-target-group-binding"
    version       = "0.0.5"
    chart         = "aws-target-group-bindings"
    force_update  = true
    wait          = false
    recreate_pods = true
    force_update  = true
    deploy        = 1
  }
  set = [
    {
      name  = "name"
      value = data.terraform_remote_state.loadbalancer.outputs.target_group_names[0]
    },
    {
      name  = "namespace"
      value = "default"
    },
    {
      name  = "service.name"
      value = "ingress-nginx-controller"
    },
    {
      name  = "targetGroupARN"
      value = data.terraform_remote_state.loadbalancer.outputs.target_group_arns[0]
    },
    {
      name  = "service.port"
      value = "80"
    },
    {
      name  = "fullNameOverride"
      value = "acmecorp-target-group-binding"
    },
    {
      name  = "nameOverride"
      value = "acmecorp-target-group-binding"
    },
  ]

  depends_on = [
    null_resource.wait_for_alb_controller
  ]
}

module "argocd" {
  source  = "terraform-module/release/helm"
  version = "2.7.0"

  namespace  = "argocd"
  repository = "https://argoproj.github.io/argo-helm"

  values = [templatefile("charts/argocd/argocd.yml", {})]

  app = {
    name             = "acmecorp-argocd"
    version          = "4.8.2"
    chart            = "argo-cd"
    force_update     = true
    wait             = true
    recreate_pods    = true
    force_update     = true
    deploy           = 1
    create_namespace = true
  }
  set = [
    {
      name  = "server.config.url"
      value = "https://deployment.${data.terraform_remote_state.route53_records.outputs.domain_name}"
    },
    {
      name  = "server.ingress.hosts[0]"
      value = "deployment.${data.terraform_remote_state.route53_records.outputs.domain_name}"
    },
    {
      name  = "server.ingress.annotations.external\\-dns\\.alpha\\.kubernetes\\.io/hostname"
      value = data.terraform_remote_state.route53_records.outputs.domain_name
    },
  ]

  depends_on = [
    module.ingress-nginx, module.alb_load_balancer_controller, module.target_group_binding
  ]
}