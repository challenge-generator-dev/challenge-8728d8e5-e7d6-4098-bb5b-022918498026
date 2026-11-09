# Aprovisionamiento de Infraestructura AWS para el Servicio de Órdenes

## Descripción General

Este directorio contiene los archivos de configuración de Terraform para el aprovisionamiento de la infraestructura AWS necesaria para el servicio de órdenes. El servicio es responsable de gestionar y mantener el estado de las órdenes de los clientes dentro del sistema de procesamiento de pedidos.

### Arquitectura de la Solución

La infraestructura aprovisionada incluye los siguientes componentes:

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           VPC (10.0.0.0/16)                                  │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │                        Subnets Públicas                             │   │
│  │   ┌──────────────┐  ┌──────────────┐                                │   │
│  │   │  Public Subnet 1 │ │  Public Subnet 2 │                         │   │
│  │   │  10.0.1.0/24   │ │  10.0.2.0/24   │                         │   │
│  │   │  NAT Gateway 1  │ │  NAT Gateway 2  │                         │   │
│  │   └─────────────────┘  └─────────────────┘                                │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │                     Subnets Privadas (APP)                          │   │
│  │   ┌──────────────┐  ┌──────────────┐  ┌──────────────┐            │   │
│  │   │ 10.0.10.0/24 │  │ 10.0.11.0/24 │  │ 10.0.12.0/24 │            │   │
│  │   │  AZ: us-east-1│  │  AZ: us-east-2│  │  AZ: us-east-1│            │   │
│  │   │  EC2 / ECS    │  │  EC2 / ECS    │  │  EC2 / ECS    │            │   │
│  │   └──────────────┘  └──────────────┘  └──────────────┘            │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │                    Subnets Privadas (DATA)                          │   │
│  │   ┌──────────────┐  ┌──────────────┐                               │   │
│  │   │ 10.0.20.0/24 │  │ 10.0.21.0/24 │                               │   │
│  │   │   RDS Postgres │  │  ElastiCache  │                               │   │
│  │   └──────────────┘  └──────────────┘                               │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │                    Internet Gateway                                 │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────────────────┘
```

## Estructura de Directorios

```
infra/
├── terraform.tfvars              # Valores de variables por entorno
├── README.md                     # Este archivo
├── providers.tf                  # Configuración de providers
├── variables.tf                  # Declaraciones de variables
├── versions.tf                   # Versiones de Terraform y providers
├── main.tf                       # Configuración principal
├── outputs.tf                    # Outputs del root module
├── environments/
│   ├── dev/
│   │   ├── main.tf               # Override para desarrollo
│   │   └── terraform.tfvars      # Override de variables dev
│   └── prod/
│       ├── main.tf               # Override para producción
│       └── terraform.tfvars      # Override de variables prod
└── modules/
    ├── vpc/
    │   ├── main.tf               # Módulo de VPC
    │   ├── variables.tf          # Variables del módulo VPC
    │   └── outputs.tf            # Outputs del módulo VPC
    ├── security/
    │   ├── main.tf               # Módulo de seguridad
    │   ├── variables.tf          # Variables del módulo seguridad
    │   └── outputs.tf            # Outputs del módulo seguridad
    └── compute/
        ├── main.tf               # Módulo de compute
        ├── variables.tf          # Variables del módulo compute
        └── outputs.tf            # Outputs del módulo compute
```

## Requisitos Previos

Antes de ejecutar Terraform, asegúrese de tener instalado:

- Terraform versión 1.9.0 o superior
- AWS CLI configurado con credenciales válidas
- Permisos suficientes en la cuenta de AWS para crear recursos

### Instalación de Terraform

```bash
# En macOS con Homebrew
brew install terraform

# En Linux (download binario)
curl -fsSL https://releases.hashicorp.com/terraform/1.9.0/terraform_1.9.0_linux_amd64.zip -o terraform.zip
unzip terraform.zip
sudo mv terraform /usr/local/bin/

# Verificar instalación
terraform version
```

### Configuración de AWS CLI

```bash
# Configurar credenciales de AWS
aws configure
# Ingrese Access Key ID: [su_access_key]
# Ingrese Secret Access Key: [su_secret_key]
# Ingrese Default region name: us-east-1
# Ingrese Default output format: json

# Verificar configuración
aws sts get-caller-identity
```

## Comandos de Ejecución

### Inicialización del Entorno

```bash
# Navegar al directorio del entorno
cd infra/environments/dev  # o prod

# Inicializar Terraform (descarga providers)
terraform init

# Validar la configuración
terraform validate

# Generar plan de ejecución
terraform plan -out=tfplan
```

### Aplicar la Configuración

```bash
# Aplicar los cambios planificados
terraform apply tfplan

# O aplicar directamente (con confirmación)
terraform apply

# Ver el estado actual
terraform show
```

### Gestión del Estado

```bash
# Ver recursos en el estado
terraform state list

# Mostrar detalles de un recurso específico
terraform state show aws_vpc.main

# Importar un recurso existente
terraform import aws_vpc.main vpc-12345678

# Limpiar el estado local (¡usar con precaución!)
terraform destroy
```

## Proceso de Aprovisionamiento

El aprovisionamiento de la infraestructura sigue un proceso estructurado que garantiza la idempotencia y trazabilidad de los cambios:

### Fase 1: Configuración Inicial

1. Se configuran los providers de AWS y Terraform
2. Se define la versión de Terraform a utilizar
3. Se establecen las variables globales del proyecto
4. Se crea el archivo `terraform.tfvars` con los valores específicos del entorno

### Fase 2: Aprovisionamiento de Red (VPC)

1. Se crea la VPC con el CIDR especificado
2. Se configuran las subnets públicas y privadas
3. Se configuran los Internet Gateways
4. Se crean las tablas de enrutamiento
5. Se habilitan los NAT Gateways para tráfico saliente
6. Se configuran los Flow Logs para auditoría

### Fase 3: Aprovisionamiento de Seguridad

1. Se crean los Security Groups para cada componente
2. Se configuran las reglas de tráfico entrante y saliente
3. Se establecen los roles IAM con mínimo privilegio
4. Se configuran las políticas de acceso
5. Se habilita el cifrado en reposo para todos los recursos

### Fase 4: Aprovisionamiento de Datos

1. Se aprovisiona la instancia RDS PostgreSQL
2. Se configura ElastiCache Redis para caché
3. Se establecen las políticas de backup automatizado
4. Se configuran las réplicas de lectura si es necesario

### Fase 5: Aprovisionamiento de Compute

1. Se crea el Auto Scaling Group para las instancias
2. Se configura el Application Load Balancer
3. Se establecen las políticas de escalado
4. Se configuran los health checks
5. Se integra con WAF para protección web

### Fase 6: Observabilidad

1. Se crean los grupos de logs en CloudWatch
2. Se configuran las métricas personalizadas
3. Se establecen las alarmas para monitoreo
4. Se configura SNS para notificaciones

## Validación Post-Aprovisionamiento

Después de aplicar la configuración, es fundamental validar que todos los recursos se crearon correctamente:

### Verificación de Recursos VPC

```bash
# Listar VPCs en la cuenta
aws ec2 describe-vpcs --filters "Name=tag:Project,Values=orders-service"

# Verificar subnets
aws ec2 describe-subnets --filters "Name=vpc-id,Values=[VPC_ID]"

# Verificar NAT Gateways
aws ec2 describe-nat-gateways --filter "Name=vpc-id,Values=[VPC_ID]"
```

### Verificación de Base de Datos

```bash
# Listar instancias RDS
aws rds describe-db-instances --db-instance-identifier-prefix orders

# Verificar conectividad
aws rds describe-db-instances --db-instance-identifier orders-postgres \
  --query 'DBInstances[0].Endpoint'
```

### Verificación de EC2 / Auto Scaling

```bash
# Ver instancias en el Auto Scaling Group
aws autoscaling describe-auto-scaling-groups \
  --auto-scaling-group-names orders-service-asg \
  --query 'AutoScalingGroups[0].Instances'

# Ver estado del Load Balancer
aws elbv2 describe-load-balancers --names orders-alb
```

### Verificación de Logs

```bash
# Ver grupos de logs
aws logs describe-log-groups --log-group-name-prefix /aws/orders-service

# Ver streams de logs activos
aws logs describe-log-streams --log-group-name /aws/orders-service/application
```

## Mantenimiento y Actualizaciones

### Actualizar la Infraestructura

```bash
# Obtener los últimos cambios del repositorio
git pull origin main

# Actualizar providers
terraform init -upgrade

# Generar nuevo plan
terraform plan -out=tfplan

# Revisar el plan y aplicar si es correcto
terraform apply tfplan
```

### Añadir Nuevos Recursos

Para añadir nuevos recursos a la infraestructura:

1. Modificar el archivo `variables.tf` para declarar la nueva variable
2. Actualizar `terraform.tfvars` con el valor correspondiente
3. Añadir el recurso en el módulo correspondiente (`main.tf`)
4. Ejecutar `terraform plan` para ver los cambios
5. Aplicar con `terraform apply`

### Eliminación de Recursos

```bash
# Destruir toda la infraestructura
terraform destroy

# Destruir recursos específicos
terraform destroy -target=aws_instance.example
```

## Seguridad y Cumplimiento

### Etiquetado (Tags)

Todos los recursos incluyen etiquetas obligatorias para trazabilidad y gestión de costos:

- `Project`: Identifica el proyecto al que pertenece
- `ManagedBy`: Indica que el recurso es gestionado por Terraform
- `CostCenter`: Centro de costos para facturación
- `Compliance`: Estándar de cumplimiento aplicable

### Cifrado

- RDS: Cifrado en reposo con AWS KMS
- ElastiCache: Cifrado en tránsito y en reposo
- S3: Versionado y cifrado habilitados
- EBS: Cifrado habilitado por defecto

### Acceso

- Los roles IAM siguen el principio de mínimo privilegio
- El acceso a la base de datos es únicamente desde subnets privadas
- Los Security Groups restringen el tráfico a lo estrictamente necesario
- El acceso SSH está limitado a la subnet de gestión

## Solución de Problemas

### Error: Provider No Configurado

```
Error: No provider configuration
```

**Solución**: Ejecutar `terraform init` para descargar los providers.

### Error: Estado Bloqueado

```
Error: Error acquiring the state lock
```

**Solución**: Verificar que no haya otra ejecución de Terraform en curso. Si el bloqueo persiste, usar:

```bash
terraform force-unlock [LOCK_ID]
```

### Error: Recursos Ya Existentes

```
Error: Resource already exists
```

**Solución**: Importar el recurso existente al estado de Terraform:

```bash
terraform import [resource_type].[resource_name] [resource_id]
```

### Error: Timeout en Operaciones

Las operaciones de creación de recursos AWS pueden tomar tiempo. Aumentar el timeout en la configuración del provider si es necesario:

```hcl
provider "aws" {
  default_tags {
    tags = {
      Project   = "orders-service"
      ManagedBy = "terraform"
    }
  }

  default_tags {
    tags = var.common_tags
  }
}
```

## Referencias

- [Documentación de Terraform](https://www.terraform.io/docs/)
- [Proveedor AWS de Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Mejores Prácticas de AWS para Terraform](https://aws.amazon.com/blogs/infrastructure-and-automation/terraform-best-practices/)
- [Guía de Seguridad de AWS](https://docs.aws.amazon.com/security/)

## Historial de Cambios

| Fecha | Versión | Descripción |
|-------|---------|-------------|
| 2024-01-15 | 1.0.0 | Versión inicial del aprovisionamiento |
| 2024-02-01 | 1.1.0 | Añadido soporte para múltiples AZ |
| 2024-03-10 | 1.2.0 | Integración con WAF |

## Contacto

Para consultas sobre esta infraestructura, contactar al equipo de DevOps en: devops-team@empresa.com