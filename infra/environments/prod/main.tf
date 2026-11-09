# Configuración del entorno de producción - Servicio de Órdenes
# Este archivo es la SUPERFICIE DE PRÁCTICA: el estudiante debe completarlo

# Referencia al módulo raíz usando las variables del entorno
module "orders_service" {
  source = "../../modules/compute"

  # Variables del módulo compute
  cluster_name = var.project_name
  environment = var.environment

  # Configuración de red
  vpc_id             = module.network.vpc_id
  private_subnet_ids = module.network.private_subnet_ids

  # Configuración de ECS
  ecs_cluster_min_capacity = var.ecs_cluster_min_capacity
  ecs_cluster_max_capacity = var.ecs_cluster_max_capacity

  # Configuración de aplicación
  container_image = "orders-service:v1.0.0"
  container_port  = 8080

  # Tags
  tags = var.common_tags
}

# Módulo de red
module "network" {
  source = "../../modules/vpc"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr_block      = var.vpc_cidr_block
  public_subnet_cidrs = var.public_subnet_cidrs

  private_subnet_cidrs = var.private_subnet_cidrs

  # Tags
  tags = var.common_tags
}

# Módulo de seguridad
module "security" {
  source = "../../modules/security"

  project_name = var.project_name
  environment  = var.environment

  vpc_id = module.network.vpc_id

  # Configuración de ALB
  alb_subnet_ids = module.network.public_subnet_ids

  # Configuración de ECS
  ecs_cluster_name = module.orders_service.ecs_cluster_name
  ecs_service_name = module.orders_service.ecs_service_name

  # Dominio
  domain_name         = var.domain_name
  acm_certificate_arn = var.acm_certificate_arn

  # Tags
  tags = var.common_tags
}