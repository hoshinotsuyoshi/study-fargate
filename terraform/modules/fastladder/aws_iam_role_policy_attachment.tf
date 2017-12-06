resource "aws_iam_role_policy_attachment" "fastladder_ecs_service" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
  role       = "${aws_iam_role.fastladder_ecs.id}"
}
