module "s3-bucket" {
  source      = "../Modules/s3-bucket"
  bucket_name = var.bucket_name
}

module "cloudfront" {
  source                        = "../Modules/cloudfront"
  providers = {
    aws = aws.east
  }
  domain_name                   = var.domain_name
  cdn_domain_name_and_origin_id = module.s3-bucket.bucket_regional_domain_name
  certificate_arn               = module.route53.certificate_arn
  depends_on                    = [module.route53]
}

module "route53" {
  source = "../Modules/route53"
  providers = {
    aws = aws.east
  }
  domain_name         = var.domain_name
  alternative_name    = var.alternative_name
}

module "alias" {
  source                 = "../Modules/alias"
  
  domain_name            = var.domain_name
  alternative_name       = var.alternative_name
  cloudfront_domain_name = module.cloudfront.cloudfront_domain_name
  cloudfront_zone_id     = module.cloudfront.cloudfront_hosted_zone_id
  depends_on             = [module.cloudfront]
}


module "lambda" {
  source          = "../Modules/lambda"
  domain_name     = var.domain_name
  allowed_origins = ["*"] #TODO
  lambda_handler  = var.lambda_handler
  function_name   = var.function_name
  dynamodb_arn    = module.dynamodb.dynamodb_arn
  depends_on      = [module.dynamodb]
}

module "dynamodb" {
  source              = "../Modules/dynamodb"
  dynamodb_table_name = var.dynamodb_table_name
}
