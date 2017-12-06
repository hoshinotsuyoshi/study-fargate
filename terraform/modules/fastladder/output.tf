output "aws_alb_fastladder_dns_name" {
  value = "${aws_alb.fastladder.dns_name}"
}

output "aws_alb_fastladder_zone_id" {
  value = "${aws_alb.fastladder.zone_id}"
}
