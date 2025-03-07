######################################################################
# ECR 
######################################################################

resource "aws_ecr_repository" "repositories" {
  for_each = local.repositories

  name = each.value.name

  image_scanning_configuration {
    scan_on_push = each.value.scan_on_push
  }
}

