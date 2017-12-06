resource "aws_route_table" "fastladder" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.fastladder.id}"
  }

  vpc_id = "${aws_vpc.fastladder.id}"
}
