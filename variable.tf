
variable "function_description" {
  description = "Description for the Lambda function"
  default     = "techhub-lambda"
}

# variable "handler" {
#   description = "Handler function for the Lambda function"
#   default     = "lambda_function.lambda_handler"
# }

variable "runtime" {
  description = "Runtime version for the Lambda function"
  default     = "python3.10"
}
variable "filename" {
  description = "Path to the ZIP file containing Lambda function code and dependencies"
  default     = "./lambda_function.zip"
}

variable "timeout" {
  description = "Function timeout in seconds"
  default     = 7
}

variable "memory_size" {
  description = "Function memory size in MB"
  default     = 128
}
variable "rule_name" {
  description = "Name for the CloudWatch Event Rule"
  default     = "techhub-rule"
}

variable "rule_description" {
  description = "Description for the CloudWatch Event Rule"
  default     = "techhub-ruler"
}

variable "schedule_expression" {
  description = "Schedule expression for the CloudWatch Event Rule"
  default     = "cron(0 6 * * ? *)"  # Schedule for daily execution at 6:00 UTC
}
