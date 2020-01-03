resource "aws_batch_compute_environment" "batch_environment_managed" {
  count                 = "${var.compute_resources_type == "SPOT" ? 0 : 1}"
  compute_environment_name = "${var.compute_environment_name}"
  compute_resources {
    instance_role      = "${var.instance_role}"
    instance_type      = ["${var.instance_type}"]
    max_vcpus          = "${var.max_vcpus}"
    min_vcpus          = "${var.min_vcpus}"
    desired_vcpus      = "${var.desired_vcpus}"
    security_group_ids = ["${var.security_group_ids}"]
    subnets            = ["${var.subnets}"]
    type               = "${var.compute_resources_type}"
  }

  service_role         = "${var.service_role}"
  type                 = "${var.type}"
}

resource "aws_batch_compute_environment" "batch_environment_spot" {
  count                    = "${var.compute_resources_type == "SPOT" ? 1 : 0}"
  compute_environment_name = "${var.compute_environment_name}"
  compute_resources {
    instance_role      = "${var.instance_role}"
    instance_type      = ["${var.instance_type}"]
    max_vcpus          = "${var.max_vcpus}"
    min_vcpus          = "${var.min_vcpus}"
    desired_vcpus      = "${var.desired_vcpus}"
    security_group_ids = ["${var.security_group_ids}"]
    subnets            = ["${var.subnets}"]
    type               = "${var.compute_resources_type}"
    bid_percentage     = "${var.bid_percentage}"
    spot_iam_fleet_role = "${var.spot_iam_fleet_role}"
    bid_percentage      = "${var.bid_percentage}"
  }

  service_role         = "${var.service_role}"
  type                 = "${var.type}"
}

