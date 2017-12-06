resource "aws_security_group" "fastladder_alb" {
  name   = "${var.resource_base_name}_alb"
  vpc_id = "${aws_vpc.fastladder.id}"

  ingress = {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "fastladder_web" {
  name   = "${var.resource_base_name}_web"
  vpc_id = "${aws_vpc.fastladder.id}"

  ingress = {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"

    security_groups = [
      "${aws_security_group.fastladder_alb.id}",
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "fastladder_db" {
  name   = "${var.resource_base_name}_db"
  vpc_id = "${aws_vpc.fastladder.id}"

  ingress = {
    from_port = 5432
    to_port   = 5432
    protocol  = "tcp"

    security_groups = [
      "${aws_security_group.fastladder_web.id}",
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
