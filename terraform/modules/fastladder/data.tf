data "aws_region" "current" {
  current = true
}

data "template_file" "fastladder_environment_variables_rails" {
  template = <<-JSON
  [
    {
      "name": "DATABASE_URL",
      "value": "postgres://$${fastladder_db_user}:$${fastladder_db_pass}@$${fastladder_db_host}:$${fastladder_db_port}/$${fastladder_db_name}"
    },
    {
      "name": "RAILS_ENV",
      "value": "production"
    },
    {
      "name": "SECRET_KEY_BASE",
      "value": "$${fastladder_secret_key_base}"
    }
  ]
  JSON

  vars {
    fastladder_db_host         = "${aws_db_instance.fastladder.address}"
    fastladder_db_name         = "${aws_db_instance.fastladder.name}"
    fastladder_db_pass         = "${var.fastladder_db_pass}"
    fastladder_db_port         = "${aws_db_instance.fastladder.port}"
    fastladder_db_user         = "${aws_db_instance.fastladder.username}"
    fastladder_secret_key_base = "${var.fastladder_secret_key_base}"
  }
}
