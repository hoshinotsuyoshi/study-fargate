resource "aws_alb" "fastladder" {
  name = "${var.resource_base_name}"

  subnets = [
    "${aws_subnet.fastladder_public_a.id}",
    "${aws_subnet.fastladder_public_c.id}",
  ]

  security_groups = [
    "${aws_security_group.fastladder_alb.id}",
  ]
}
