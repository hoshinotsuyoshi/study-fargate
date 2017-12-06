resource "aws_iam_role" "fastladder_ecs" {
  assume_role_policy = <<-JSON
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
          "Service": "ecs.amazonaws.com"
        }
      }
    ]
  }
  JSON

  name = "${var.resource_base_name}_ecs"
}

resource "aws_iam_role" "fastladder_execution" {
  assume_role_policy = <<-JSON
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
          "Service": "logs.${data.aws_region.current.name}.amazonaws.com"
        }
      }
    ]
  }
  JSON

  name = "${var.resource_base_name}_execution"
}
