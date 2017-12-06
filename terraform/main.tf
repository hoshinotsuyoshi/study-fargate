terraform {
  backend "s3" {}
}

provider "aws" {}

variable "aws_autoscaling_group_desired_capacity" {
  default = 1
}

variable "aws_autoscaling_group_max_size" {
  default = 1
}

variable "aws_autoscaling_group_min_size" {
  default = 1
}

variable "aws_db_instance_fastladder_instance_class" {
  default = "db.t2.micro"
}

variable "aws_ecs_service_desired_count_rails" {
  default = 1
}

variable "aws_launch_configuration_fastladder_image_id" {
  default = "ami-fad25980"
}

variable "aws_launch_configuration_fastladder_instance_type" {
  default = "t2.micro"
}

variable "resource_base_name" {
  default = "fastladder"
}

variable "fastladder_db_name" {
  default = "fastladder"
}

variable "fastladder_db_pass" {}

variable "fastladder_db_user" {
  default = "root"
}

variable "fastladder_secret_key_base" {}

module "fastladder" {
  aws_autoscaling_group_desired_capacity            = "${var.aws_autoscaling_group_desired_capacity}"
  aws_autoscaling_group_max_size                    = "${var.aws_autoscaling_group_max_size}"
  aws_autoscaling_group_min_size                    = "${var.aws_autoscaling_group_min_size}"
  aws_db_instance_fastladder_instance_class         = "${var.aws_db_instance_fastladder_instance_class}"
  aws_ecs_service_desired_count_rails               = "${var.aws_ecs_service_desired_count_rails}"
  aws_launch_configuration_fastladder_image_id      = "${var.aws_launch_configuration_fastladder_image_id}"
  aws_launch_configuration_fastladder_instance_type = "${var.aws_launch_configuration_fastladder_instance_type}"
  resource_base_name                                = "${var.resource_base_name}"
  fastladder_db_name                                = "${var.fastladder_db_name}"
  fastladder_db_pass                                = "${var.fastladder_db_pass}"
  fastladder_db_user                                = "${var.fastladder_db_user}"
  fastladder_secret_key_base                        = "${var.fastladder_secret_key_base}"
  source                                            = "./modules/fastladder"
}
