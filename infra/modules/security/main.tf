# Módulo de seguridad para el servicio de órdenes
# Configura grupos de seguridad y políticas IAM

variable "vpc_id" {
  description = "ID de la VPC donde se crearán los recursos de seguridad"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue (dev, prod)"
  type        = string
}

variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "Bloques CIDR permitidos para acceso desde internet"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# Grupo de seguridad para el servicio de órdenes (ALB)
resource "aws_security_group" "orders_alb" {
  name        = "${var.project_name}-orders-alb-sg-${var.environment}"
  description = "Grupo de seguridad para el Application Load Balancer del servicio de órdenes"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP desde internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  ingress {
    description = "HTTPS desde internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    description     = "Todo el tráfico saliente"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
  }

  tags = {
    Name        = "${var.project_name}-orders-alb-sg-${var.environment}"
    Environment = var.environment
    Project     = var.project_name
    Component   = "orders-service"
  }
}

# Grupo de seguridad para el servicio de órdenes (ECS)
resource "aws_security_group" "orders_service" {
  name        = "${var.project_name}-orders-service-sg-${var.environment}"
  description = "Grupo de seguridad para el servicio de órdenes ECS"
  vpc_id      = var.vpc_id

  ingress {
    description              = "HTTP desde ALB"
    from_port                = 8080
    to_port                  = 8080
    protocol                 = "tcp"
    security_groups          = [aws_security_group.orders_alb.id]
    ipv6_cidr_blocks         = []
    prefix_list_ids          = []
    self                     = false
  }

  egress {
    description     = "Todo el tráfico saliente"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
  }

  tags = {
    Name        = "${var.project_name}-orders-service-sg-${var.environment}"
    Environment = var.environment
    Project     = var.project_name
    Component   = "orders-service"
  }
}

# Grupo de seguridad para Amazon RDS (PostgreSQL)
resource "aws_security_group" "orders_database" {
  name        = "${var.project_name}-orders-db-sg-${var.environment}"
  description = "Grupo de seguridad para la base de datos del servicio de órdenes"
  vpc_id      = var.vpc_id

  ingress {
    description     = "PostgreSQL desde servicio de órdenes"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.orders_service.id]
  }

  egress {
    description     = "Todo el tráfico saliente"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
  }

  tags = {
    Name        = "${var.project_name}-orders-db-sg-${var.environment}"
    Environment = var.environment
    Project     = var.project_name
    Component   = "orders-database"
  }
}

# Rol IAM para la tarea ECS del servicio de órdenes
resource "aws_iam_role" "ecs_task_execution" {
  name = "${var.project_name}-ecs-task-execution-role-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

# Política IAM para ejecución de tareas ECS
resource "aws_iam_policy" "ecs_task_execution_policy" {
  name        = "${var.project_name}-ecs-task-execution-policy-${var.environment}"
  description = "Política para ejecución de tareas ECS del servicio de órdenes"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ecs:DescribeTasks",
          "ecs:DescribeContainerInstances",
          "ecs:DescribeTaskDefinition"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

# Adjuntar política al rol
resource "aws_iam_role_policy_attachment" "ecs_task_execution_attachment" {
  role       = aws_iam_role.ecs_task_execution.name
  policy_arn = aws_iam_policy.ecs_task_execution_policy.arn
}