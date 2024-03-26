resource "aws_lambda_function" "lambda" {
  function_name = var.function_description
  description   = var.function_description
  handler       = "lambda_function.lambda_handler"
  runtime       = var.runtime
  role          = aws_iam_role.iam_for_lambda.arn
  filename      = var.filename
  timeout       = var.timeout
  memory_size   = var.memory_size
}
resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    =  aws_cloudwatch_event_rule.lambda_schedule.arn
}
