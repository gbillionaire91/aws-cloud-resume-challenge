variable "oac_name" {
    description = "Name of the CloudFront Origin Access Control"
    type = string
    default = "s3_bucket_oac"
}

variable "origin_access_control_origin_type" {
    description = "The origin type must be the same as the origin domain"
    type = string
    default = "s3"
}

variable "signing_behavior" {
    description = "Specifies which requests Cloudfront signs"
    type = string
    default = "always"
}

variable "signing_protocol" {
    description = "Determines how CloudFront authenticates (signs) requests"
    type = string
    default = "sigv4" # The only valid value
}

variable "restriction_type" {
  description = "Method to restrict distribution of your content by country"
  type = string
  default = "none"
}

variable "default_root_object" {
    description = "Object CloudFront returns when an end user requests the root URL"
    type = string
    default = "index.html"
}

variable "domain_name" {
    description = "Custom somain name for which the certificate should be issued"
    type = string
}

variable "cdn_domain_name_and_origin_id" {
    type = string
}

variable "acm_certificate_arn" {
    type = string
}