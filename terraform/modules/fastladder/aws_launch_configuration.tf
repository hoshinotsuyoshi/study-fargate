resource "aws_launch_configuration" "fastladder" {
  associate_public_ip_address = true
  depends_on                  = ["aws_internet_gateway.fastladder"]
  iam_instance_profile        = "${aws_iam_instance_profile.fastladder.id}"
  image_id                    = "${var.aws_launch_configuration_fastladder_image_id}"
  instance_type               = "${var.aws_launch_configuration_fastladder_instance_type}"
  name_prefix                 = "fastladder-"
  security_groups             = ["${aws_security_group.fastladder_web.id}"]
  user_data                   = "#!/bin/bash\necho ECS_CLUSTER='${aws_ecs_cluster.fastladder.name}' >> /etc/ecs/ecs.config"
}
