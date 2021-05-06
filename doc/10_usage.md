## Usage
```hcl
#############################################
#######With compute-resources-type Ec2#######
 module "batch" {
  source                   = "corpit-consulting-public/batch-compute-environment-mod/aws"
  version                  = "v2.1.0"
  compute_environment_name = var.compute_environment_name
  instance_role            = aws_iam_instance_profile.batch_instance_profile.arn
  instance_type            = var.batch_instance_type
  max_vcpus                = var.max_vcpus
  desired_vcpus            = var.desired_vcpus
  min_vcpus                = var.min_vcpus
  security_group_ids       = [module.sg_batch.id]
  subnets = split(
    ",",
    join(
      ",",
      module.main_vpc.private_subnet,
    ),
  )
  compute_resources_type = var.compute_resources_type
  launch_template {
    launch_template_id   = var.launch_template_id
    launch_template_name = var.launch_template_name
    version              = var.tempalte_version
  }
  service_role = var.service_role
  type         = var.type
  state        = var.state
}
##############################################
#######With compute-resources-type SPOT#######

module "batch" {
  source                   = "corpit-consulting-public/batch-compute-environment-mod/aws"
  version                  = "v2.1.0"
  compute_environment_name = var.compute_environment_name
  instance_role            = aws_iam_instance_profile.batch_instance_profile.arn
  instance_type            = var.batch_instance_type
  max_vcpus                = var.max_vcpus
  desired_vcpus            = var.desired_vcpus
  min_vcpus                = var.min_vcpus
  security_group_ids       = [module.sg_batch.id]
  subnets = split(
    ",",
    join(
      ",",
      module.main_vpc.private_subnet,
    ),
  )
  compute_resources_type = var.compute_resources_type
  service_role           = aws_iam_role.batch_service_role.arn
  spot_iam_fleet_role    = aws_iam_role.batch_spot_fleet_role.arn
  bid_percentage         = var.bid_percentage
  type                   = var.type
}

```
