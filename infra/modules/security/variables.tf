# Input variables for the security module
# These variables configure security groups, IAM roles, and other
# security-related resources for the orders service.

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "project_name" {
  description = "Name of the project, used for resource naming and tagging"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where security groups will be created"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "instance_port" {
  description = "Port on which the orders service instances listen"
  type        = number
  default     = 8080
}

variable "db_port" {
  description = "Port for the RDS database"
  type        = number
  default     = 5432
}

variable "ssh_port" {
  description = "Port for SSH access"
  type        = number
  default     = 22
}

variable "allowed_ssh_cidr_blocks" {
  description = "List of CIDR blocks allowed to access instances via SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allowed_http_cidr_blocks" {
  description = "List of CIDR blocks allowed to access the orders service via HTTP"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "enable_https" {
  description = "Whether to enable HTTPS access to the orders service"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags to apply to security resources"
  type        = map(string)
  default     = {}
}

variable "create_iam_role" {
  description = "Whether to create an IAM role for the orders service instances"
  type        = bool
  default     = true
}

variable "iam_policy_arns" {
  description = "List of IAM policy ARNs to attach to the orders service role"
  type        = list(string)
  default     = []
}

variable "additional_security_group_rules" {
  description = "Additional security group rules to apply"
  type = list(object({
    type        = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default = []
}