# Definición de salidas de Terraform
# Este archivo expone la información de los recursos creados para que
# pueda ser consumida por otros módulos o configuraciones externas.
#
# Los outputs permiten la integración entre diferentes partes de la
# infraestructura y facilitan la automatización de despliegues.

# =============================================================================
# OUTPUTS DE RED (VPC)
# =============================================================================

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "Bloque CIDR de la VPC"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value       = module.vpc.private_subnet_ids
}

output "availability_zones" {
  description = "Zonas de disponibilidad utilizadas"
  value       = module.vpc.availability_zones
}

# =============================================================================
# OUTPUTS DE SEGURIDAD
# =============================================================================

output "security_group_ids" {
  description = "IDs de los grupos de seguridad créés"
  value       = module.security.security_group_ids
}

output "iam_role_arn" {
  description = "ARN del rol IAM para el servicio"
  value       = module.security.iam_role_arn
}

output "kms_key_arn" {
  description = "ARN de la clave KMS para cifrado"
  value       = module.security.kms_key_arn
}

# =============================================================================
# OUTPUTS DE CÓMPUTO
# =============================================================================

output "instance_ids" {
  description = "IDs de las instancias EC2 créées"
  value       = module.compute.instance_ids
}

output "load_balancer_arn" {
  description = "ARN del balanceador de carga"
  value       = module.compute.load_balancer_arn
}

output "load_balancer_dns_name" {
  description = "Nombre DNS del balanceador de carga"
  value       = module.compute.load_balancer_dns_name
}

output "asg_name" {
  description = "Nombre del Auto Scaling Group"
  value       = module.compute.asg_name
}

# =============================================================================
# OUTPUTS DE ALMACENAMIENTO
# =============================================================================

output "db_subnet_group_name" {
  description = "Nombre del grupo de subredes de base de datos"
  value       = aws_db_subnet_group.main.name
}

output "logs_bucket_name" {
  description = "Nombre del bucket de logs"
  value       = aws_s3_bucket.logs.id
}

output "logs_bucket_arn" {
  description = "ARN del bucket de logs"
  value       = aws_s3_bucket.logs.arn
}

# =============================================================================
# OUTPUTS GENERALES
# =============================================================================

output "account_id" {
  description = "ID de la cuenta de AWS"
  value       = data.aws_caller_identity.current.account_id
}

output "region" {
  description = "Región de AWS desplegada"
  value       = var.aws_region
}

output "environment" {
  description = "Entorno desplegado"
  value       = var.environment
}

output "service_endpoint" {
  description = "Endpoint del servicio de órdenes"
  value       = "https://${module.compute.load_balancer_dns_name}"
}