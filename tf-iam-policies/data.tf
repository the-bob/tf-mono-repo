data "aws_iam_policy_document" "iam_ecr_policy" {
  statement {
    sid = "AllowFullECRAccess"
    actions = [
      "ecr:*"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "iam_tf_policy" {
  statement {
    sid       = "VisualEditor0"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "rds:*",
      "ec2:*",
    ]
  }

  statement {
    sid    = "VisualEditor1"
    effect = "Allow"

    resources = [
      "arn:aws:s3:::acmecorp-tf-state-eu-north-1",
      "arn:aws:s3:::acmecorp-tf-state-eu-north-1/*",
    ]

    actions = ["s3:*"]
  }
}