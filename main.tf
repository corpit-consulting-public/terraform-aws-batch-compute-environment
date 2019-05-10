resource "aws_batch_compute_environment" "sample" {
  compute_environment_name = "${var.compute_environment_name}"
  compute_resources {
    instance_role      = "${var.instance_role}"
    instance_type      = ["${var.instance_type}"]
    max_vcpus          = "${var.max_vcpus}"
    min_vcpus          = "${var.min_vcpus}"
    security_group_ids = ["${var.security_group_ids}"]
    subnets            = ["${var.subnet}"]
    type               = "${var.compute_resources_type}"
  }

  service_role         = "${var.service_role}"
  type                 = "${var.type}"
}
