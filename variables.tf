##Variables for AWS Batch

variable "compute_environment_name" {
  type        = string
  description = "The name for your compute environment. Up to 128 letters (uppercase and lowercase), numbers, and undercores are allowed"
}

variable "compute_resource" {
  type        = string
  description = "Details of the compute resources managed by the compute environment. This parameter is required for managed compute environments"
  default     = ""
}

variable "service_role" {
  type        = string
  description = "The full Amazon Resource Name(ARN) of the IAM role that allows AES Batch to make calls to other AWS services on you behalf"
}

variable "state" {
  type        = string
  description = "The state of the compute environment. If the state id ENABLED, then the compute environment accepts jobs from a queue and can scale out automatically based on queues. Valid items are ENABLED or DISABLED. Default to ENABLED"
  default     = "ENABLED"
}

variable "type" {
  type        = string
  description = "The type of the compute environment. Valid items are MANAGED or UNMANAGED"
}

variable "bid_percentage" {
  type        = string
  description = "Integer of minimum percentage that a Spot Instance price must be when compared with the On-Demand price for that Instance type before instances are launched. For example, if you bid percentage is 20% (20), then the Spot price must be bellow 20% of the current On-Demand price for that EC2 Instance. This parameter is required for SPOT compute environments"
  default     = ""
}

variable "desired_vcpus" {
  type        = string
  description = "The desired number of EC2 vCPUS in the compute environment"
  default     = ""
}

variable "ec2_key_pair" {
  type        = string
  description = "The EC2 key pair thst is used for instances launched in the compute environment"
  default     = ""
}

variable "image_id" {
  type        = string
  description = "The Amazon Machine Image (AMI) ID used for instances launched in the compute environment"
  default     = ""
}

variable "instance_role" {
  type        = string
  description = "The Amazon ECS instance role applied to Amazon EC2 instance in a computed environment"
}

variable "instance_type" {
  type        = list(string)
  description = "A list of instance that may be launched"
}

variable "launche_template" {
  type        = string
  description = "The launch template to use for your compute resource"
  default     = ""
}

variable "max_vcpus" {
  type        = string
  description = "The maximum number of EC2 vCPUs that an environment can reach"
}

variable "min_vcpus" {
  type        = string
  description = "The minimum number of EC2 vCPUs that environment should maintain"
}

variable "security_group_ids" {
  type        = list(string)
  description = "A list of EC2 security group that are associated with instances launched in the compuite environments"
}

variable "spot_iam_fleet_role" {
  type        = string
  description = "The Amazon Resource Name (ARN) of the Amazon EC2 Spot Fleet IAM role applied to a SPOT compute environment. This parameter is required for SPOT compute environment"
  default     = ""
}

variable "subnets" {
  type        = list(string)
  description = "A list of VPC subnet into which the compute resource are launced"
}

variable "tags" {
  type        = string
  description = "Key-value pair tags to be applied to resource that are launched in the compute environment"
  default     = ""
}

variable "compute_resources_type" {
  type        = string
  description = "The type of compute environment. Valid items are EC2 or SPOT"
}

##Variable for launch_template
#launche_template supports the following

variable "launch_template_id" {
  type        = string
  description = "ID of the lauch template. You must specify either the launch template ID or launch template name in the request, but not both"
  default     = ""
}

variable "launch_template_name" {
  type        = string
  description = "Name of the launch template"
  default     = ""
}

variable "version" {
  type        = string
  description = "The version number of the template. Default: The default version of the launch template"
  default     = ""
}

