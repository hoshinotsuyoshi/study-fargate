resource "aws_iam_instance_profile" "fastladder" {
  name = "${var.resource_base_name}"
  role = "${aws_iam_role.fastladder_ec2.name}"
}
