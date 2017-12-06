terraform {
  backend "s3" {}
}

provider "aws" {}

variable "aws_account_id" {}

variable "aws_db_instance_fastladder_instance_class" {
  default = "db.t2.micro"
}

variable "aws_ecs_service_desired_count_rails" {
  default = 1
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
  aws_account_id                            = "${var.aws_account_id}"
  aws_db_instance_fastladder_instance_class = "${var.aws_db_instance_fastladder_instance_class}"
  aws_ecs_service_desired_count_rails       = "${var.aws_ecs_service_desired_count_rails}"
  resource_base_name                        = "${var.resource_base_name}"
  fastladder_db_name                        = "${var.fastladder_db_name}"
  fastladder_db_pass                        = "${var.fastladder_db_pass}"
  fastladder_db_user                        = "${var.fastladder_db_user}"
  fastladder_secret_key_base                = "${var.fastladder_secret_key_base}"
  source                                    = "./modules/fastladder"
}
