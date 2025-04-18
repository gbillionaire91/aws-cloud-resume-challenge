variable "domain_name" {
    description = "This is the domain name"
    type = string
}

variable "allowed_origins" {
    description = "Set of domains Lambda is allowed to use as its origins"
    default = []
}

variable "function_name" {
    description = "Name of the Lambda function"
    type = string
}

variable "lambda_handler" {
    description = "Name of the Lambda Handler"
    type = string
}

variable "dynamodb_arn" {
    type = string
}

