resource "aws_db_instance" "fastladder" {
  allocated_storage          = 20
  auto_minor_version_upgrade = true
  backup_retention_period    = 7
  backup_window              = "20:00-21:00"
  db_subnet_group_name       = "${aws_db_subnet_group.fastladder.name}"
  engine                     = "postgres"
  engine_version             = "9.6.1"
  identifier                 = "${var.resource_base_name}"
  instance_class             = "${var.aws_db_instance_fastladder_instance_class}"
  multi_az                   = false
  name                       = "fastladder"
  parameter_group_name       = "${aws_db_parameter_group.fastladder.name}"
  password                   = "${var.fastladder_db_pass}"
  skip_final_snapshot        = true
  username                   = "${var.fastladder_db_user}"

  vpc_security_group_ids = [
    "${aws_security_group.fastladder_db.id}",
  ]
}
