# =============================================================================
# Variables de configuración específicas por entorno para el servicio de órdenes
# =============================================================================
# Este archivo contiene los valores concretos que Terraform utilizará para
# aprovisionar la infraestructura en cada entorno. Los valores aquí definidos
# sustituyen las variables declaradas en variables.tf.
#
# IMPORTANTE: Este archivo NO debe contener secretos sensibles. Utilice
# variables de entorno o AWS Secrets Manager para información sensible.
# =============================================================================

# -----------------------------------------------------------------------------
# Configuración común entre entornos
# -----------------------------------------------------------------------------

# Nombre del proyecto que se utiliza como prefijo para todos los recursos
project_name = "orders-service"

# Entorno de despliegue (dev, staging, prod)
environment = "dev"

# Región de AWS donde se aprovisionarán los recursos
aws_region = "us-east-1"

# Tags obligatorios que se aplicarán a todos los recursos
common_tags = {
  Project     = "orders-service"
  ManagedBy   = "terraform"
  CostCenter  = "engineering"
  Compliance  = "pci-dss"
}

# -----------------------------------------------------------------------------
# Configuración de red (VPC)
# -----------------------------------------------------------------------------

# CIDR blocks para la VPC y sus subnets
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
database_subnet_cidrs = ["10.0.20.0/24", "10.0.21.0/24"]

# Configuración de NAT Gateway
nat_gateway_count = 2
enable_nat_gateway = true

# DNS personalizado para la VPC
enable_dns_hostnames = true
enable_dns_support   = true

# -----------------------------------------------------------------------------
# Configuración de seguridad
# -----------------------------------------------------------------------------

# Habilitar flujos de tráfico entre zonas de disponibilidad
az_traffic_enabled = true

# Puerto SSH permitido desde CIDR específico (solo IP de gestión)
ssh_allowed_cidr = ["10.0.0.0/24"]

# Puerto RDP permitido (Windows)
rdp_allowed_cidr = []

# Puerto HTTP/HTTPS para aplicaciones
http_allowed_cidr = ["0.0.0.0/0"]

# Habilitar logs de flujo de VPC
enable_vpc_flow_logs = true
flow_log_destination_type = "cloud-watch-logs"
flow_log_format = "${version} ${account-id} ${interface-id} ${srcaddr} ${dstaddr} ${srcport} ${dstport} ${protocol} ${packets} ${bytes} ${start} ${end} ${action} ${log-status}"

# -----------------------------------------------------------------------------
# Configuración de base de datos (RDS PostgreSQL)
# -----------------------------------------------------------------------------

# Identificador y nombre de la instancia RDS
db_instance_identifier = "orders-postgres"
db_name                = "orders_db"

# Tamaño y tipo de instancia de base de datos
db_instance_class    = "db.t3.medium"
db_allocated_storage = 100
db_max_allocated_storage = 500

# Motor y versión de base de datos
db_engine         = "postgres"
db_engine_version = "15.4"

# Configuración de almacenamiento
db_storage_type           = "gp3"
db_storage_encrypted      = true
db_delete_protection      = false

# Configuración de backups y mantenimiento
db_backup_retention_days = 7
db_maintenance_window    = "mon:03:00-mon:04:00"
db_backup_window         = "03:00-04:00"
db_skip_final_snapshot   = true

# Configuración de conexión
db_multi_az               = false
db_publicly_accessible    = false
db_vpc_security_group_ids = []

# -----------------------------------------------------------------------------
# Configuración de caché (ElastiCache Redis)
# -----------------------------------------------------------------------------

# Identificador del cluster Redis
redis_cluster_id = "orders-redis"

# Tipo de nodo y número de nodos
redis_node_type            = "cache.t3.medium"
redis_num_cache_nodes      = 2
redis_parameter_group_name = "default.redis7.x"

# Motor y versión
redis_engine         = "redis"
redis_engine_version = "7.0"

# Configuración de red
redis_port = 6379
redis_subnet_ids = []

# Configuración de seguridad y backups
redis_at_rest_encryption_enabled = true
redis_transit_encryption_enabled = true
redis_auth_token_enabled          = true
redis_auto_minor_version_upgrade  = true
redis_automatic_failover_enabled  = false

# Backup
redis_backup_enabled   = true
redis_backup_retention = 3

# -----------------------------------------------------------------------------
# Configuración de compute (EC2 / ECS)
# -----------------------------------------------------------------------------

# Tipo de instancia para los servidores de aplicación
instance_type = "t3.medium"

# Configuración de Auto Scaling
min_size     = 2
max_size     = 4
desired_capacity = 2

# Configuración de volumen raíz
root_volume_size = 50
root_volume_type = "gp3"

# Configuración adicional de EBS
enable_ebs_optimized = true
ebs_device_name      = "/dev/sda1"

# Configuración de Health Check
health_check_type = "ELB"
health_check_grace_period = 300

# Configuración de lifecycle hooks
instance_initiated_shutdown_behavior = "terminate"

# -----------------------------------------------------------------------------
# Configuración de balanceador de carga (ALB)
# -----------------------------------------------------------------------------

# Nombre y tipo del load balancer
lb_name               = "orders-alb"
lb_type               = "application"
lb_internal           = false
lb_scheme             = "internet-facing"

# Configuración de listeners y reglas
lb_enable_deletion_protection = true
lb_idle_timeout               = 4000

# Configuración de TLS/SSL
lb_enable_tls = true
lb_tls_certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/example"
lb_tls_policy       = "ELBSecurityPolicy-2016-08"
lb_tls_ports        = [443]

# Cross-zone load balancing
lb_enable_cross_zone_load_balancing = true

# -----------------------------------------------------------------------------
# Configuración de Auto Scaling policies
# -----------------------------------------------------------------------------

# Política de escalado basado en CPU
scale_up_cpu_threshold   = 75
scale_down_cpu_threshold = 25

# Política de escalado basado en memoria
scale_up_memory_threshold   = 80
scale_down_memory_threshold = 40

# Política de escalado basado en requests
scale_up_requests_threshold   = 10000
scale_down_requests_threshold = 2000

# Cooldown periods (en segundos)
scale_up_cooldown   = 300
scale_down_cooldown = 300

# -----------------------------------------------------------------------------
# Configuración de Amazon S3 para logs y artefactos
# -----------------------------------------------------------------------------

# Nombre del bucket de logs
logs_bucket_name = "orders-service-logs"

# Nombre del bucket de artefactos
artefacts_bucket_name = "orders-service-artefacts"

# Habilitar-versionado en buckets
bucket_versioning_enabled = true

# Configuración de lifecycle para logs
logs_lifecycle_transition_days = 30
logs_lifecycle_expiration_days = 90

# -----------------------------------------------------------------------------
# Configuración de SNS para notificaciones
# -----------------------------------------------------------------------------

# Temas de SNS para notificaciones
sns_topic_name = "orders-service-alerts"
sns_topic_display_name = "Orders Service Alerts"

# Configuración de suscripciones
sns_email_subscription = "devops-team@empresa.com"

# -----------------------------------------------------------------------------
# Configuración de CloudWatch
# -----------------------------------------------------------------------------

# Grupo de logs de aplicación
log_group_name = "/aws/orders-service/application"
log_group_retention = 7
log_group_kms_key_id = ""

# Métricas personalizadas
enable_custom_metrics = true
metrics_namespace = "OrdersService"

# Alarmas de CloudWatch
alarm_cpu_utilization_high_threshold = 80
alarm_cpu_utilization_low_threshold  = 20
alarm_memory_utilization_high_threshold = 85
alarm_disk_utilization_high_threshold = 85
alarm_response_time_threshold_ms = 2000

# -----------------------------------------------------------------------------
# Configuración de WAF Web ACL
# -----------------------------------------------------------------------------

# Habilitar WAF
enable_waf = true

# Nombre de la Web ACL
waf_web_acl_name = "orders-service-waf"

# Reglas de WAF
waf_rules = [
  {
    name     = "AWSManagedRulesCommonRuleSet"
    priority = 1
    action   = "block"
  },
  {
    name     = "AWSManagedRulesKnownBadInputsRuleSet"
    priority = 2
    action   = "block"
  },
  {
    name     = "AWSManagedRulesSQLiRuleSet"
    priority = 3
    action   = "block"
  },
  {
    name     = "AWSManagedRulesLinuxRuleSet"
    priority = 4
    action   = "block"
  }
]

# Rate limiting
waf_rate_limit = 2000

# -----------------------------------------------------------------------------
# Configuración de IAM roles y políticas
# -----------------------------------------------------------------------------

# Nombre del rol de EC2
ec2_role_name = "orders-service-ec2-role"

# Nombre del rol de ECS Task
ecs_task_role_name = "orders-service-ecs-task-role"
ecs_execution_role_name = "orders-service-ecs-execution-role"

# Políticas gestionadas a utilizar
managed_policy_arns = [
  "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
  "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
]

# -----------------------------------------------------------------------------
# Configuración de Secrets Manager
# -----------------------------------------------------------------------------

# Secret de base de datos
db_secret_name = "orders-service/db-credentials"

# Secret de Redis
redis_secret_name = "orders-service/redis-auth"

# Habilitar rotación automática
enable_secret_rotation = false

# -----------------------------------------------------------------------------
# Configuración de Route 53 (DNS)
# -----------------------------------------------------------------------------

# Nombre de la zona hébergée
hosted_zone_name = "orders.empresa.com"

# Registros DNS
dns_records = {
  "api" = {
    type = "A"
    alias = true
    lb_dns_name = "orders-alb-1234567890.us-east-1.elb.amazonaws.com"
    lb_zone_id = "Z35SXDOTRQ7X7K"
  },
  "health" = {
    type = "CNAME"
    value = "api.orders.empresa.com"
    ttl  = 60
  }
}