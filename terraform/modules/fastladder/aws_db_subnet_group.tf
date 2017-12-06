resource "aws_db_subnet_group" "fastladder" {
  name        = "${var.resource_base_name}"
  description = "${var.resource_base_name}"

  subnet_ids = [
    "${aws_subnet.fastladder_private_a.id}",
    "${aws_subnet.fastladder_private_c.id}",
  ]
}
