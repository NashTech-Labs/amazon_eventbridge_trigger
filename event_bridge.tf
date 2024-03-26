resource "aws_cloudwatch_event_rule" "lambda_schedule" {
  name                = var.rule_name
  description         = var.rule_description
  schedule_expression = var.schedule_expression
}

# Create a target for the EventBridge rule to invoke the Lambda function
resource "aws_cloudwatch_event_target" "lambda_target" {
  rule = aws_cloudwatch_event_rule.lambda_schedule.name
  arn  = aws_lambda_function.lambda.arn
}
