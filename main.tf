resource "aws_batch_compute_environment" "batch_environment_managed" {
  compute_environment_name = var.compute_environment_name
  compute_resources {
    instance_role      = var.instance_role
    instance_type      = var.instance_type
    max_vcpus          = var.max_vcpus
    min_vcpus          = var.min_vcpus
    desired_vcpus      = var.desired_vcpus
    security_group_ids = var.security_group_ids
    subnets            = var.subnets
    type               = var.compute_resources_type
    bid_percentage      = var.compute_resources_type == "SPOT" ? var.bid_percentage : null
    spot_iam_fleet_role = var.compute_resources_type == "SPOT" ? spot_iam_fleet_role : null
  }

  service_role = var.service_role
  type         = var.type
}

