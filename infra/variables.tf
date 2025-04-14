variable "aws_region" {
    description = "AWS Region"
    type = string
}

variable "bucket_name" {
    description = "Name of the bucket"
    type = string
}

variable "domain_name" {
    type = string
}

variable "lambda_handler" {
    type = string
}

variable "function_name" {
    type = string
}

variable "dynamodb_table_name" {
    type = string
}
