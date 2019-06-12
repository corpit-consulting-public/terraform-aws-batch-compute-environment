## Usage
```hcl
#############################################
#######With compute-resources-type Ec2#######
 module "batch-environment" {
  source                   = "./modules/tf-aws-batch"
  compute_environment_name = "${var.compute_environment_name}"
  instance_role            = "${var.instance_role}"
  instance_type            = ["${var.instance_type}"]
  max_vcpus                = "${var.max_vcpus}"
  min_vcpus                = "${var.min_vcpus}"
  security_group_ids       = ["${var.security_group_ids}"]
  subnets                  = ["${var.subnets}"]
  compute_resources_type   = "${var.compute_resources_type}"
  service_role             = "${var.service_role}"
  type                     = "${var.type}"
}
##############################################
#######With compute-resources-type SPOT#######

module "batch-environment-spot" {
  source                   = "./modules/tf-aws-batch"
  compute_environment_name = "${var.compute_environment_name}"
  instance_role            = "${var.instance_role}"
  instance_type            = ["${var.instance_type}"]
  max_vcpus                = "${var.max_vcpus}"
  min_vcpus                = "${var.min_vcpus}"
  security_group_ids       = ["${var.security_group_ids}"]
  subnets                  = ["${var.subnets}"]
  type                     = "${var.compute_resources_type}"
  spot_iam_fleet_role      = "${var.spot_iam_fleet_role}"
  service_role             = "${var.service_role}"
  type                     = "${var.type}"
}

```
