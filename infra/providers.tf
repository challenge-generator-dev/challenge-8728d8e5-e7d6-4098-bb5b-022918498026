# Terraform configuration for AWS provider
# This file declares the required providers and their versions for provisioning
# AWS infrastructure for the orders service.

terraform {
  required_version = "~> 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.65.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
  }
}

# AWS Provider configuration
# The provider is configured to use the AWS region specified in variables.tf
# and supports default tags for all resources.
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.environment
      Service     = "orders-service"
      ManagedBy   = "Terraform"
      Project     = var.project_name
    }
  }
}

# Local provider for managing local files
provider "local" {
  # No explicit configuration needed
}

# TLS provider for generating private keys
provider "tls" {
  # No explicit configuration needed
}

# Outputs for provider configuration (useful for debugging)
output "aws_provider_region" {
  description = "The AWS region configured for the provider"
  value       = var.aws_region
}

output "aws_provider_default_tags" {
  description = "Default tags applied to all AWS resources"
  value       = provider::aws.default_tags.tags
}