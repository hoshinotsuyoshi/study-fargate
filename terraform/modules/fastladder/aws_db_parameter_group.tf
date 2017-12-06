resource "aws_db_parameter_group" "fastladder" {
  name   = "${var.resource_base_name}"
  family = "postgres9.6"
}
