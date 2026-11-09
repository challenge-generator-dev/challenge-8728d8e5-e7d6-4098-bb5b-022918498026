# Configuración específica del entorno de desarrollo
# Servicio de Órdenes - AWS Infrastructure as Code

# Identificadores del proyecto
project_name = "orders-service"
environment  = "dev"

# Configuración de red
aws_region = "us-east-1"
vpc_cidr_block           = "10.1.0.0/16"
public_subnet_cidrs      = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnet_cidrs     = ["10.1.10.0/24", "10.1.20.0/24"]

# Configuración de compute
instance_type = "t3.medium"

# Configuración de ECS
ecs_cluster_min_capacity = 1
ecs_cluster_max_capacity = 3

# Configuración de RDS
db_instance_class    = "db.t3.medium"
db_engine            = "postgres"
db_engine_version    = "15.4"
db_allocated_storage = 50
db_name              = "orders_db"

# Configuración de S3
artifact_bucket_name = "orders-service-dev-artifacts"

# Configuración de dominio y TLS
domain_name         = "orders-dev.service.com"
acm_certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/abc123"