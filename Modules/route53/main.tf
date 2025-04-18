#Retrieve information about hosted zone from AWS
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
  private_zone = false
}

resource "aws_route53_record" "cert_validation" {
  for_each = { for dvo in var.domain_validation_options : dvo.domain_name => {
    name   = dvo.resource_record_name
    type   = dvo.resource_record_type
    record = dvo.resource_record_value
  } }

  # allow_overwrite = true
  name    = each.value.name
  type    = each.value.type
  records = [each.value.record]
  ttl     = 60
  zone_id = data.aws_route53_zone.created.zone_id
}

resource "aws_acm_certificate_validation" "validate_cert" {
  certificate_arn         = var.certificate_arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
  

  depends_on = [aws_route53_record.cert_validation]
}
