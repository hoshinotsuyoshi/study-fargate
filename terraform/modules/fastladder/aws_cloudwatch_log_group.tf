resource "aws_cloudwatch_log_group" "fastladder" {
  name = "${var.resource_base_name}"
}
