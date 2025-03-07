module "iam_policy_ecr_push" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "4.20.1"

  name        = "acmecorp_ecr_push_policy"
  path        = "/"
  description = "IAM Policy for ECR Push"

  policy = data.aws_iam_policy_document.iam_ecr_policy.json

  tags = local.tags
}

module "iam_policy_tf" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "4.20.1"

  name        = "acmecorp_tf_policy"
  path        = "/"
  description = "IAM Policy for Terraform"

  policy = data.aws_iam_policy_document.iam_tf_policy.json

  tags = local.tags
}