resource "aws_ecs_cluster" "fastladder" {
  name = "${var.resource_base_name}"
}
