
# tf-aws-batch-compute-envirnment

AWS Batch is a regional service that simplifies running batch jobs across multiple Availability Zones within a region. You can create AWS Batch compute environments within a new or existing VPC. After a compute environment is up and associated with a job queue, you can define job definitions that specify which Docker container images to run your jobs. Container images are stored in and pulled from container registries, which may exist within or outside of your AWS infrastructure.

Creates a AWS Batch compute environment. Compute environments contain the Amazon ECS container instances that are used to run containerized batch jobs.
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
## README.md
This README file was created runnnign generate-readme.sh placed insinde hooks directory.
If you want to update README.md file, run that script while being in 'hooks' folder.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bid\_percentage | Integer of minimum percentage that a Spot Instance price must be when compared with the On-Demand price for that Instance type before instances are launched. For example, if you bid percentage is 20% (20), then the Spot price must be bellow 20% of the current On-Demand price for that EC2 Instance. This parameter is required for SPOT compute environments | string | `""` | no |
| compute\_environment\_name | The name for your compute environment. Up to 128 letters (uppercase and lowercase), numbers, and undercores are allowed | string | n/a | yes |
| compute\_resource | Details of the compute resources managed by the compute environment. This parameter is required for managed compute environments | string | `""` | no |
| compute\_resources\_type | The type of compute environment. Valid items are EC2 or SPOT | string | n/a | yes |
| desired\_vcpus | The desired number of EC2 vCPUS in the compute environment | string | `""` | no |
| ec2\_key\_pair | The EC2 key pair thst is used for instances launched in the compute environment | string | `""` | no |
| image\_id | The Amazon Machine Image (AMI) ID used for instances launched in the compute environment | string | `""` | no |
| instance\_role | The Amazon ECS instance role applied to Amazon EC2 instance in a computed environment | string | n/a | yes |
| instance\_type | A list of instance that may be launched | list | n/a | yes |
| launch\_template\_id | ID of the lauch template. You must specify either the launch template ID or launch template name in the request, but not both | string | `""` | no |
| launch\_template\_name | Name of the launch template | string | `""` | no |
| launche\_template | The launch template to use for your compute resource | string | `""` | no |
| max\_vcpus | The maximum number of EC2 vCPUs that an environment can reach | string | n/a | yes |
| min\_vcpus | The minimum number of EC2 vCPUs that environment should maintain | string | n/a | yes |
| security\_group\_ids | A list of EC2 security group that are associated with instances launched in the compuite environments | list | n/a | yes |
| service\_role | The full Amazon Resource Name(ARN) of the IAM role that allows AES Batch to make calls to other AWS services on you behalf | string | n/a | yes |
| spot\_iam\_fleet\_role | The Amazon Resource Name (ARN) of the Amazon EC2 Spot Fleet IAM role applied to a SPOT compute environment. This parameter is required for SPOT compute environment | string | `""` | no |
| state | The state of the compute environment. If the state id ENABLED, then the compute environment accepts jobs from a queue and can scale out automatically based on queues. Valid items are ENABLED or DISABLED. Default to ENABLED | string | `"ENABLED"` | no |
| subnets | A list of VPC subnet into which the compute resource are launced | list | n/a | yes |
| tags | Key-value pair tags to be applied to resource that are launched in the compute environment | string | `""` | no |
| type | The type of the compute environment. Valid items are MANAGED or UNMANAGED | string | n/a | yes |
| version | The version number of the template. Default: The default version of the launch template | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn |  |

