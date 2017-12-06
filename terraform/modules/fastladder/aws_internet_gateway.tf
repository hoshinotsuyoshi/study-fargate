resource "aws_internet_gateway" "fastladder" {
  vpc_id = "${aws_vpc.fastladder.id}"

  tags {
    Name = "fastladder"
  }
}
