resource "aws_batch_compute_environment" "batch_environment_managed" {
  count                = "1"
  compute_environment_name = "${var.compute_environment_name}"
  compute_resources {
    instance_role      = "${var.instance_role}"
    instance_type      = var.instance_type
    max_vcpus          = "${var.max_vcpus}"
    min_vcpus          = "${var.min_vcpus}"
    security_group_ids = var.security_group_ids
    subnets            = var.subnets
    type               = "EC2"
  }
  service_role         = "${var.service_role}"
  type                 = "MANAGED"
}