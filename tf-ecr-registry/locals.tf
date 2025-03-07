locals {
  repositories = {
    acmecorp-nginx = {
      name         = "acmecorp-nginx"
      scan_on_push = true
    },
    acmecorp-php-base = {
      name         = "acmecorp-php-base"
      scan_on_push = true
    },
    acmecorp-php-cli = {
      name         = "acmecorp-php-cli"
      scan_on_push = true
    },
    acmecorp-php-fpm = {
      name         = "acmecorp-php-fpm"
      scan_on_push = true
    }
  }
}