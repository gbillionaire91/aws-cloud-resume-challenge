variable "oac_name" {
    type = string
    default = "s3_bucket_oac"
}
variable "origin_access_control_origin_type" {
    description = "The origin type must be the same as the origin domain"
    type = string
    default = "s3"
}
variable "signing_behavior" {
    type = string
    default = "always"
}
variable "signing_protocol" {
    type = string
    default = "sigv4" # The only valid value
}
variable "restriction_type" {
    type = string
    default = "none"
}
variable "default_root_object" {
    type = string
    default = "index.html"
}
variable "domain_name" {}
variable "cdn_domain_name_and_origin_id" {}
variable "certificate_arn" {}