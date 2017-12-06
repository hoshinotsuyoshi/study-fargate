resource "aws_ecs_task_definition" "fastladder_rails" {
  family = "${var.resource_base_name}_rails"

  container_definitions = <<-JSON
  [
    {
      "environment": ${data.template_file.fastladder_environment_variables_rails.rendered},
      "image": "ssig33/fastladder-postgres",
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "${var.resource_base_name}",
          "awslogs-region": "${data.aws_region.current.name}",
          "awslogs-stream-prefix": "rails"
        }
      },
      "memory": 300,
      "name": "${var.resource_base_name}_rails",
      "portMappings": [
        {
          "containerPort": 5000,
          "protocol": "tcp"
        }
      ]
    }
  ]
  JSON
}

resource "aws_ecs_task_definition" "fastladder_rails_db_setup" {
  family = "${var.resource_base_name}_rails_db_setup"

  container_definitions = <<-JSON
  [
    {
      "command": ["bin/rake", "db:create", "db:migrate"],
      "environment": ${data.template_file.fastladder_environment_variables_rails.rendered},
      "image": "ssig33/fastladder-postgres",
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "${var.resource_base_name}",
          "awslogs-region": "${data.aws_region.current.name}",
          "awslogs-stream-prefix": "rails"
        }
      },
      "memory": 300,
      "networkMode": "awsvpc",
      "name": "${var.resource_base_name}_rails"
    }
  ]
  JSON
}
