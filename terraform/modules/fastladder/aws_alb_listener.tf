resource "aws_alb_listener" "fastladder_rails" {
  load_balancer_arn = "${aws_alb.fastladder.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.fastladder_rails.id}"
    type             = "forward"
  }
}
