resource "aws_vpc" "fastladder" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "fastladder"
  }
}
