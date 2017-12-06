resource "aws_ecs_service" "fastladder_rails" {
  cluster                            = "${aws_ecs_cluster.fastladder.id}"
  deployment_minimum_healthy_percent = 50
  desired_count                      = "${var.aws_ecs_service_desired_count_rails}"
  iam_role                           = "${aws_iam_role.fastladder_ecs.arn}"
  name                               = "${var.resource_base_name}_rails"

  load_balancer {
    container_name   = "${var.resource_base_name}_rails"
    container_port   = "5000"
    target_group_arn = "${aws_alb_target_group.fastladder_rails.arn}"
  }

  task_definition = "${aws_ecs_task_definition.fastladder_rails.arn}"
}
