resource "aws_route_table_association" "fastladder_a" {
  route_table_id = "${aws_route_table.fastladder.id}"
  subnet_id      = "${aws_subnet.fastladder_public_a.id}"
}

resource "aws_route_table_association" "fastladder_c" {
  route_table_id = "${aws_route_table.fastladder.id}"
  subnet_id      = "${aws_subnet.fastladder_public_c.id}"
}
