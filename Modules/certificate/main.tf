# Create the TLS/SSL certificate
terraform {
  required_providers {
    aws = {
      version = ">=4.9.0"
      source  = "hashicorp/aws"
    }
  }
}

resource "aws_acm_certificate" "cert" {
  domain_name               = "*.${var.domain_name}"
  validation_method         = var.validation_method

  # subject_alternative_names = var.subject_alternative_names

  lifecycle {
    create_before_destroy = true
  }
}
