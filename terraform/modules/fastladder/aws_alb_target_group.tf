resource "aws_alb_target_group" "fastladder_rails" {
  deregistration_delay = 10

  health_check {
    healthy_threshold   = 2
    interval            = 60
    matcher             = "302"
    path                = "/"
    timeout             = 10
    unhealthy_threshold = 5
  }

  name     = "${var.resource_base_name}-rails"
  port     = 80
  protocol = "HTTP"

  stickiness {
    type = "lb_cookie"
  }

  vpc_id = "${aws_vpc.fastladder.id}"
}
