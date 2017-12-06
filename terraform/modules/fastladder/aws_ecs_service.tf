resource "aws_ecs_service" "fastladder_rails" {
  cluster                            = "${aws_ecs_cluster.fastladder.id}"
  deployment_minimum_healthy_percent = 50
  desired_count                      = "${var.aws_ecs_service_desired_count_rails}"
  launch_type                        = "FARGATE"
  name                               = "${var.resource_base_name}_rails"

  load_balancer {
    container_name   = "${var.resource_base_name}_rails"
    container_port   = "5000"
    target_group_arn = "${aws_alb_target_group.fastladder_rails.arn}"
  }

  network_configuration {
    subnets = [
      "${aws_subnet.fastladder_public_a.id}",
      "${aws_subnet.fastladder_public_c.id}",
    ]

    security_groups = [
      "${aws_security_group.fastladder_alb.id}",
      "${aws_security_group.fastladder_web.id}",
    ]

    assign_public_ip = "ENABLED"
  }

  task_definition = "${aws_ecs_task_definition.fastladder_rails.arn}"
}
