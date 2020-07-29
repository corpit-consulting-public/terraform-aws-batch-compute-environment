##Variables for AWS Batch

variable "compute_environment_name" {
  type        = string
  description = "The name for your compute environment. Up to 128 letters (uppercase and lowercase), numbers, and undercores are allowed"
}

variable "service_role" {
  type        = string
  description = "The full Amazon Resource Name(ARN) of the IAM role that allows AES Batch to make calls to other AWS services on you behalf"
}

variable "desired_vcpus" {
  type        = string
  description = "The desired number of EC2 vCPUS in the compute environment"
  default     = ""
}

variable "instance_role" {
  type        = string
  description = "The Amazon ECS instance role applied to Amazon EC2 instance in a computed environment"
}

variable "instance_type" {
  type        = "list"
  description = "A list of instance that may be launched"
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
  type        = "list"
  description = "A list of EC2 security group that are associated with instances launched in the compuite environments"
}

variable "subnets" {
  type        = "list"
  description = "A list of VPC subnet into which the compute resource are launced"
}

variable "tags" {
  type        = string
  description = "Key-value pair tags to be applied to resource that are launched in the compute environment"
  default     = ""
}

