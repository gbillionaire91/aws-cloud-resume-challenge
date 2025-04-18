terraform {
  required_providers {
    aws = {
      version = ">=4.9.0"
      source  = "hashicorp/aws"
    }
  }
}

data "aws_route53_zone" "created" {
  name = var.domain_name
}

resource "aws_route53_record" "alias" {
  zone_id = data.aws_route53_zone.created.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.cloudfront_domain_name
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "subdomain" {
  zone_id = data.aws_route53_zone.created.zone_id
  name    = var.alternative_name
  type    = "A"

  alias {
    name                   = var.cloudfront_domain_name
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
}
