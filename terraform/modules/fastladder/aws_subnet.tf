resource "aws_subnet" "fastladder_public_a" {
  availability_zone = "${data.aws_region.current.name}a"
  cidr_block        = "10.0.1.0/24"
  vpc_id            = "${aws_vpc.fastladder.id}"
}

resource "aws_subnet" "fastladder_public_c" {
  availability_zone = "${data.aws_region.current.name}c"
  cidr_block        = "10.0.2.0/24"
  vpc_id            = "${aws_vpc.fastladder.id}"
}

resource "aws_subnet" "fastladder_private_a" {
  availability_zone = "${data.aws_region.current.name}a"
  cidr_block        = "10.0.128.0/24"
  vpc_id            = "${aws_vpc.fastladder.id}"
}

resource "aws_subnet" "fastladder_private_c" {
  availability_zone = "${data.aws_region.current.name}c"
  cidr_block        = "10.0.129.0/24"
  vpc_id            = "${aws_vpc.fastladder.id}"
}
