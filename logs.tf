resource "aws_cloudwatch_log_group" "main" {
  name              = "${var.container_name}-log"
  retention_in_days = var.log_retention_days
}