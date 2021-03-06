resource "aws_batch_compute_environment" "batch_environment" {
  compute_environment_name = var.compute_environment_name
  compute_resources {
    instance_role      = var.instance_role
    instance_type      = var.instance_type
    max_vcpus          = var.max_vcpus
    min_vcpus          = var.min_vcpus
    security_group_ids = var.security_group_ids
    subnets            = var.subnets
    type               = var.compute_resources_type
    tags               = var.compute_resource_tags
    desired_vcpus       = var.desired_vcpus
    bid_percentage      = var.compute_resources_type == "SPOT" ? var.bid_percentage : null
    spot_iam_fleet_role = var.compute_resources_type == "SPOT" ? var.spot_iam_fleet_role : null
    
    dynamic "launch_template" {
    for_each = var.compute_resources_type == "EC2" ? {} : var.launch_template
    content {
        launch_template_id   = launch_template.value.launch_template_id
        launch_template_name = launch_template.value.launch_template_name
        version              = launch_template.value.tempalte_version
      }
    }
  }

  service_role = var.service_role
  type         = var.type
  state        = var.state
  tags              = var.tags
}
