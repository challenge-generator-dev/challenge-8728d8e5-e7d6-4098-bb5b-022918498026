# Input variables for the compute module
# These variables configure EC2 instances, Auto Scaling Groups, and
# related compute resources for the orders service.

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "project_name" {
  description = "Name of the project, used for resource naming and tagging"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where compute resources will be created"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the Auto Scaling Group"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the RDS instance"
  type        = list(string)
}

variable "security_group_id" {
  description = "ID of the security group for the orders service instances"
  type        = string
}

variable "key_pair_name" {
  description = "Name of the EC2 key pair for SSH access"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the orders service"
  type        = string
  default     = "t3.medium"
}

variable "min_instance_size" {
  description = "Minimum number of instances in the Auto Scaling Group"
  type        = number
  default     = 2
}

variable "max_instance_size" {
  description = "Maximum number of instances in the Auto Scaling Group"
  type        = number
  default     = 4
}

variable "desired_instance_size" {
  description = "Desired number of instances in the Auto Scaling Group"
  type        = number
  default     = 2
}

variable "ami_id" {
  description = "ID of the AMI to use for the instances"
  type        = string
  default     = ""
}

variable "user_data" {
  description = "User data script to run on instance launch"
  type        = string
  default     = ""
}

variable "target_group_arns" {
  description = "List of target group ARNs for the Auto Scaling Group"
  type        = list(string)
  default     = []
}

variable "health_check_grace_period" {
  description = "Time (in seconds) after instance comes into service before checking health"
  type        = number
  default     = 300
}

variable "health_check_type" {
  description = "EC2 or ELB health check type for the Auto Scaling Group"
  type        = string
  default     = "EC2"
}

variable "tags" {
  description = "Additional tags to apply to compute resources"
  type        = map(string)
  default     = {}
}

variable "create_launch_template" {
  description = "Whether to create a launch template for the Auto Scaling Group"
  type        = bool
  default     = true
}

variable "enable_auto_scaling" {
  description = "Whether to enable auto scaling for the orders service"
  type        = bool
  default     = true
}

variable "db_security_group_id" {
  description = "ID of the security group for the RDS instance"
  type        = string
  default     = ""
}

variable "db_endpoint" {
  description = "Endpoint of the RDS instance for the orders service"
  type        = string
  default     = ""
}