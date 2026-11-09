# Archivo principal de configuración de Terraform
# Este archivo orquesta la creación de todos los recursos de infraestructura
# necesarios para el servicio de órdenes en AWS.
#
# La arquitectura utiliza módulos para separar las responsabilidades:
# - VPC: configuración de red y subredes
# - Security: grupos de seguridad, IAM roles y políticas
# - Compute: EC2, ECS, Lambda u otros recursos de cómputo
#
# Los módulos se parametrizan mediante variables para permitir la reutilización
# entre diferentes entornos (dev, staging, prod).

# =============================================================================
# CONFIGURACIÓN DE RED (VPC)
# =============================================================================
# El módulo de VPC provee la infraestructura de red necesaria incluyendo:
# - VPC principal con CIDR bloque configurado
# - Subredes públicas y privadas
# - Tablas de enrutamiento
# - NAT Gateway para acceso a internet desde subredes privadas
# - Internet Gateway para acceso saliente desde subredes públicas

module "vpc" {
  source = "./modules/vpc"

  environment           = var.environment
  vpc_cidr              = var.vpc_cidr
  availability_zones    = var.availability_zones
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  enable_nat_gateway   = var.enable_nat_gateway
  single_nat_gateway   = var.single_nat_gateway

  tags = {
    Environment = var.environment
    Project     = "servicio-ordenes"
    ManagedBy   = "terraform"
  }
}

# =============================================================================
# CONFIGURACIÓN DE SEGURIDAD
# =============================================================================
# El módulo de seguridad gestiona:
# - Grupos de seguridad para controlar el tráfico de entrada y salida
# - Roles y políticas IAM con principio de mínimo privilegio
# - Secrets y parámetros seguros mediante AWS Secrets Manager o SSM
# - Certificados SSL/TLS mediante AWS Certificate Manager

module "security" {
  source = "./modules/security"

  environment           = var.environment
  vpc_id                = module.vpc.vpc_id
  allowed_cidr_blocks   = var.allowed_cidr_blocks
  enable_waf            = var.enable_waf
  enable_cloudtrail     = var.enable_cloudtrail

  tags = {
    Environment = var.environment
    Project     = "servicio-ordenes"
    ManagedBy   = "terraform"
  }
}

# =============================================================================
# CONFIGURACIÓN DE CÓMPUTO
# =============================================================================
# El módulo de compute provisiona los recursos de ejecución del servicio:
# - Instancias EC2 o grupos de auto-scaling
# - Clusters ECS/EKS para orquestación de contenedores
# - Funciones Lambda para procesamiento serverless
# - Balanceadores de carga (ALB/NLB) para distribución de tráfico

module "compute" {
  source = "./modules/compute"

  environment          = var.environment
  vpc_id               = module.vpc.vpc_id
  public_subnet_ids    = module.vpc.public_subnet_ids
  private_subnet_ids   = module.vpc.private_subnet_ids
  security_group_ids   = module.security.security_group_ids
  instance_type        = var.instance_type
  min_instances        = var.min_instances
  max_instances        = var.max_instances
  desired_capacity     = var.desired_capacity
  ami_id               = var.ami_id

  tags = {
    Environment = var.environment
    Project     = "servicio-ordenes"
    ManagedBy   = "terraform"
  }
}

# =============================================================================
# ALMACENAMIENTO
# =============================================================================
# Recursos de almacenamiento para el servicio de órdenes:
# - RDS PostgreSQL para datos transaccionales
# - ElastiCache Redis para caché de sesiones y datos frecuentes
# - S3 para almacenamiento de documentos y logs

resource "aws_db_subnet_group" "main" {
  name       = "${var.environment}-servicio-ordenes-db-subnet-group"
  subnet_ids = module.vpc.private_subnet_ids

  tags = {
    Name        = "${var.environment}-servicio-ordenes-db-subnet-group"
    Environment = var.environment
    Project     = "servicio-ordenes"
  }
}

resource "aws_s3_bucket" "logs" {
  bucket = "${var.environment}-servicio-ordenes-logs-${data.aws_caller_identity.current.account_id}"

  tags = {
    Environment = var.environment
    Project     = "servicio-ordenes"
    ManagedBy   = "terraform"
  }
}

data "aws_caller_identity" "current" {}