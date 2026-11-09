# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `infra/versions.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/vpc/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/vpc/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/vpc/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/security/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/security/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/security/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/compute/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/compute/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/compute/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/dev/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/prod/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Mapa de componentes

El repo tiene una carpeta por componente. Cada uno se instala y verifica dentro de la suya.

| Componente | Carpeta | Rol | Capa | Track | Tecnologias |
|---|---|---|---|---|---|
| `infra` | `infra/` | practice | infra | Terraform (AWS) | Terraform |
| `api` | `api/` | chapter, support | server | Java | - |

## Orden de arranque

1. `cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate` — componente `infra` (practice).
2. `cd api && mvn clean compile` — componente `api` (chapter, support).

### Contratos entre componentes

- `api` expone http (api: http://localhost:8080):
  - `POST /api/orders`
  - `GET /api/orders/{id}`
  - `PUT /api/orders/{id}`
  - `DELETE /api/orders/{id}`

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).
- **Java**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Lo que le falta a este proyecto

Esto NO lo tenes que adivinar: salio de comparar el proyecto contra la arquitectura declarada del reto y de un analisis estatico del codigo. Completalo TODO.

### Referencias colgando en el codigo que si esta

Cada una rompe la compilacion:

- `api/src/main/java/com/pragma/orderservice/OrderserviceApplication.java` — `AwsProperties.region`: Se invoca `region` sobre `AwsProperties`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/pragma/orderservice/OrderserviceApplication.java` — `AwsProperties.accessKey`: Se invoca `accessKey` sobre `AwsProperties`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/pragma/orderservice/OrderserviceApplication.java` — `AwsProperties.secretKey`: Se invoca `secretKey` sobre `AwsProperties`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/pragma/orderservice/OrderserviceApplication.java` — `AwsProperties.dynamodbEndpoint`: Se invoca `dynamodbEndpoint` sobre `AwsProperties`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/pragma/orderservice/OrderserviceApplication.java` — `AwsProperties.snsEndpoint`: Se invoca `snsEndpoint` sobre `AwsProperties`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/pragma/orderservice/OrderserviceApplication.java` — `AwsProperties.sqsEndpoint`: Se invoca `sqsEndpoint` sobre `AwsProperties`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/pragma/orderservice/infrastructure/OrderController.java` — `OrderRequestDTO.items`: Se invoca `items` sobre `OrderRequestDTO`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/pragma/orderservice/infrastructure/OrderController.java` — `OrderRequestDTO.customerId`: Se invoca `customerId` sobre `OrderRequestDTO`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/pragma/orderservice/infrastructure/OrderController.java` — `OrderRequestDTO.status`: Se invoca `status` sobre `OrderRequestDTO`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/pragma/orderservice/infrastructure/persistence/OrderItemEntity.java` — `OrderItem.getProductId`: Se invoca `getProductId` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/pragma/orderservice/infrastructure/persistence/OrderItemEntity.java` — `OrderItem.getQuantity`: Se invoca `getQuantity` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/pragma/orderservice/infrastructure/persistence/OrderItemEntity.java` — `OrderItem.getUnitPrice`: Se invoca `getUnitPrice` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/pragma/orderservice/infrastructure/persistence/OrderItemEntity.java` — `OrderItem.getSubtotal`: Se invoca `getSubtotal` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/pragma/orderservice/infrastructure/persistence/OrderItemEntity.java` — `OrderItem.setProductId`: Se invoca `setProductId` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/pragma/orderservice/infrastructure/persistence/OrderItemEntity.java` — `OrderItem.setQuantity`: Se invoca `setQuantity` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/pragma/orderservice/infrastructure/persistence/OrderItemEntity.java` — `OrderItem.setUnitPrice`: Se invoca `setUnitPrice` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/pragma/orderservice/infrastructure/persistence/OrderItemEntity.java` — `OrderItem.setSubtotal`: Se invoca `setSubtotal` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/test/java/com/pragma/orderservice/application/OrderServiceTest.java` — `OrderItem.setProductId`: Se invoca `setProductId` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/test/java/com/pragma/orderservice/application/OrderServiceTest.java` — `OrderItem.setQuantity`: Se invoca `setQuantity` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/test/java/com/pragma/orderservice/application/OrderServiceTest.java` — `OrderItem.setUnitPrice`: Se invoca `setUnitPrice` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/test/java/com/pragma/orderservice/application/OrderServiceTest.java` — `OrderItem.setSubtotal`: Se invoca `setSubtotal` sobre `OrderItem`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/test/java/com/pragma/orderservice/application/OrderServiceTest.java` — `OrderService.getOrder`: Se invoca `getOrder` sobre `OrderService`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/test/java/com/pragma/orderservice/application/OrderServiceTest.java` — `Order.isPresent`: Se invoca `isPresent` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/test/java/com/pragma/orderservice/application/OrderServiceTest.java` — `Order.get`: Se invoca `get` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.

## Como saber que terminaste

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd api && mvn clean compile)
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Backend, Especialidad Desarrollador, Tecnología Java, Senior L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform (corrida e2e 20261109074436524), Aprovisiona con Terraform la infraestructura AWS que necesita el servicio de ordenes

### Misión / candidato
Versionar la infraestructura del servicio

### Reto
- Tema: Infraestructura como codigo para el servicio de ordenes
- Seniority: senior-l2
- Tipo: practical
- Título: Aprovisionamiento de Infraestructura con Terraform para el Servicio de Ordenes
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración Inicial — objetivo: Configurar el entorno de Terraform y definir los recursos básicos de AWS necesarios para el servicio de ordenes. — entregable (NO resolver): Configuración de Terraform que define los recursos básicos de AWS para el servicio de ordenes.
- Fase 2: Aprovisionamiento y Validación — objetivo: Aprovisionar la infraestructura definida en la fase anterior y validar que los recursos se han creado correctamente. — entregable (NO resolver): Infraestructura de AWS aprovisionada y validada para el servicio de ordenes.
- Fase 3: Versionado y Documentación — objetivo: Versionar la configuración de Terraform y documentar el proceso de aprovisionamiento. — entregable (NO resolver): Configuración de Terraform versionada y documentación del proceso de aprovisionamiento.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: infra/providers.tf ===
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

// === ARCHIVO: infra/variables.tf ===
# Input variables for the Terraform configuration
# These variables allow parameterization of the infrastructure setup
# and support different environments (dev, prod, etc.)

variable "aws_region" {
  description = "AWS region where the infrastructure will be provisioned"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Name of the project, used for resource naming and tagging"
  type        = string
  default     = "orders-service"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
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

variable "availability_zones" {
  description = "List of availability zones to use for subnets"
  type        = list(string)
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

variable "db_instance_class" {
  description = "RDS instance class for the orders database"
  type        = string
  default     = "db.t3.small"
}

variable "db_allocated_storage" {
  description = "Allocated storage for the RDS instance (GB)"
  type        = number
  default     = 20
}

variable "db_engine_version" {
  description = "PostgreSQL engine version for the RDS instance"
  type        = string
  default     = "15.4"
}

variable "db_name" {
  description = "Name of the database to create"
  type        = string
  default     = "ordersdb"
}

variable "db_username" {
  description = "Master username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "Master password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "enable_nat_gateway" {
  description = "Whether to enable NAT gateway for private subnets"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Whether to use a single NAT gateway for all private subnets"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Whether to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Whether to enable DNS support in the VPC"
  type        = bool
  default     = true
}

// === ARCHIVO: infra/modules/vpc/variables.tf ===
# Input variables for the VPC module
# These variables configure the VPC and related networking resources
# for the orders service infrastructure.

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  validation {
    condition     = can(cidrhost(var.vpc_cidr_block, 0))
    error_message = "The VPC CIDR block must be a valid CIDR notation (e.g., 10.0.0.0/16)"
  }
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  validation {
    condition     = length(var.public_subnet_cidrs) >= 2
    error_message = "At least two public subnet CIDRs are required"
  }
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  validation {
    condition     = length(var.private_subnet_cidrs) >= 2
    error_message = "At least two private subnet CIDRs are required"
  }
}

variable "availability_zones" {
  description = "List of availability zones to use for subnets"
  type        = list(string)
  validation {
    condition     = length(var.availability_zones) >= 2
    error_message = "At least two availability zones are required"
  }
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "project_name" {
  description = "Name of the project, used for resource naming and tagging"
  type        = string
}

variable "enable_nat_gateway" {
  description = "Whether to enable NAT gateway for private subnets"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Whether to use a single NAT gateway for all private subnets"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Whether to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Whether to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags to apply to VPC resources"
  type        = map(string)
  default     = {}
}

// === ARCHIVO: infra/modules/security/variables.tf ===
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

// === ARCHIVO: infra/modules/compute/variables.tf ===
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

// === ARCHIVO: infra/versions.tf ===
# Configuración de versiones de Terraform y proveedores
# Este archivo define las versiones requeridas de Terraform y los proveedores
# necesarios para aprovisionar la infraestructura del servicio de órdenes.
#
# Terraform requiere que se especifique la versión del proveedor de AWS
# para garantizar la compatibilidad y evitar cambios inesperados en la
# configuración de infraestructura.

terraform {
  required_version = ">= 1.9.0"

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

# Proveedor de AWS configurado con la región por defecto
# La región puede ser sobrescrita mediante variables de entorno o archivos tfvars
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.environment
      Project     = "servicio-ordenes"
      ManagedBy   = "terraform"
    }
  }

  skip_credentials_validation = var.skip_credentials_validation
  skip_requesting_account_id  = var.skip_requesting_account_id
  skip_metadata_api_check     = var.skip_metadata_api_check
}

# Proveedor local para recursos que requieren acceso al sistema de archivos local
# Útil para generación de archivos de configuración locales o certificados
provider "local" {
  # La configuración del proveedor local es mínima ya que opera a nivel de sistema de archivos
}

// === ARCHIVO: infra/main.tf ===
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

// === ARCHIVO: infra/outputs.tf ===
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

// === ARCHIVO: infra/terraform.tfvars ===
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

// === ARCHIVO: infra/README.md ===
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

// === ARCHIVO: infra/environments/dev/terraform.tfvars ===
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

// === ARCHIVO: infra/environments/dev/main.tf ===
# Configuración del entorno de desarrollo - Servicio de Órdenes
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
  container_image = "orders-service:latest"
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

// === ARCHIVO: infra/environments/prod/main.tf ===
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

// === ARCHIVO: infra/modules/vpc/main.tf ===
# Módulo de VPC para el servicio de órdenes
# Este stub define la estructura base del módulo de VPC

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
}

variable "availability_zones" {
  description = "Zonas de disponibilidad para las subredes"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "Bloques CIDR para las subredes públicas"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Bloques CIDR para las subredes privadas"
  type        = list(string)
}

variable "environment" {
  description = "Entorno de despliegue (dev, prod)"
  type        = string
}

variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
}

# Recurso de VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.project_name}-vpc-${var.environment}"
    Environment = var.environment
    Project     = var.project_name
  }
}

# Subredes públicas
resource "aws_subnet" "public" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.project_name}-public-subnet-${count.index + 1}-${var.environment}"
    Type        = "public"
    Environment = var.environment
    Project     = var.project_name
  }
}

# Subredes privadas
resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name        = "${var.project_name}-private-subnet-${count.index + 1}-${var.environment}"
    Type        = "private"
    Environment = var.environment
    Project     = var.project_name
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.project_name}-igw-${var.environment}"
    Environment = var.environment
    Project     = var.project_name
  }
}

# Tabla de rutas pública
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name        = "${var.project_name}-public-rt-${var.environment}"
    Environment = var.environment
    Project     = var.project_name
  }
}

# Asociación de subredes públicas con tabla de rutas
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

// === ARCHIVO: infra/modules/vpc/outputs.tf ===
# Salidas del módulo de VPC
# Proporciona los valores necesarios para otros módulos

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "Bloque CIDR de la VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value       = aws_subnet.private[*].id
}

output "internet_gateway_id" {
  description = "ID del Internet Gateway"
  value       = aws_internet_gateway.main.id
}

output "public_route_table_id" {
  description = "ID de la tabla de rutas pública"
  value       = aws_route_table.public.id
}

// === ARCHIVO: infra/modules/security/main.tf ===
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

// === ARCHIVO: infra/modules/security/outputs.tf ===
# Outputs del módulo de seguridad
# Proporciona los ARNs de roles IAM y otros recursos de seguridad para consumo externo

output "iam_role_arn" {
  description = "ARN del rol IAM utilizado por las instancias del servicio de órdenes"
  value       = aws_iam_role.ec2_service_role.arn
}

output "iam_instance_profile_arn" {
  description = "ARN del perfil de instancia asociado a las EC2"
  value       = aws_iam_instance_profile.ec2_profile.arn
}

output "security_group_id" {
  description = "ID del grupo de seguridad para el servicio de órdenes"
  value       = aws_security_group.orders_sg.id
}

output "kms_key_arn" {
  description = "ARN de la clave KMS para cifrado de datos en reposo"
  value       = aws_kms_key.orders_key.arn
}

output "secret_manager_arn" {
  description = "ARN del secreto en AWS Secrets Manager para credenciales"
  value       = aws_secretsmanager_secret.orders_credentials.arn
}

// === ARCHIVO: infra/modules/compute/main.tf ===
# Módulo de compute para el servicio de órdenes
# Superficie de práctica: implementar los recursos de compute necesarios

# Recurso: Instancia EC2 para el servicio de órdenes
resource "aws_instance" "orders_service" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
  }

  vpc_security_group_ids = var.security_group_ids

  tags = merge(
    var.common_tags,
    {
      Name        = "orders-service-${var.environment}"
      Environment = var.environment
      Component   = "orders-service"
    }
  )
}

# Recurso: Configuración de volúmenes adicionales
resource "aws_ebs_volume" "data_volume" {
  count             = var.data_volume_enabled ? 1 : 0
  availability_zone = var.availability_zone
  size              = var.data_volume_size
  type              = var.data_volume_type
  encrypted         = var.encryption_enabled

  tags = merge(
    var.common_tags,
    {
      Name        = "orders-service-data-${var.environment}"
      Environment = var.environment
    }
  )
}

# Recurso: Attach del volumen de datos
resource "aws_volume_attachment" "data_volume_attachment" {
  count       = var.data_volume_enabled ? 1 : 0
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.data_volume[0].id
  instance_id = aws_instance.orders_service.id
}

// === ARCHIVO: infra/modules/compute/outputs.tf ===
# Outputs del módulo de compute para el servicio de órdenes
# Superficie de práctica: definir los valores exportados por el módulo

output "instance_id" {
  description = "ID de la instancia EC2 del servicio de órdenes"
  value       = aws_instance.orders_service.id
}

output "instance_private_ip" {
  description = "Dirección IP privada de la instancia"
  value       = aws_instance.orders_service.private_ip
}

output "instance_public_ip" {
  description = "Dirección IP pública de la instancia"
  value       = aws_instance.orders_service.public_ip
}

output "instance_availability_zone" {
  description = "Zona de disponibilidad de la instancia"
  value       = aws_instance.orders_service.availability_zone
}

output "data_volume_id" {
  description = "ID del volumen de datos adicional"
  value       = var.data_volume_enabled ? aws_ebs_volume.data_volume[0].id : null
}

output "security_groups" {
  description = "Grupos de seguridad aplicados a la instancia"
  value       = aws_instance.orders_service.vpc_security_group_ids
}

output "arn" {
  description = "ARN de la instancia EC2"
  value       = aws_instance.orders_service.arn
}

// === ARCHIVO: api/pom.xml ===
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.5.6</version>
        <relativePath/>
    </parent>

    <groupId>com.pragma</groupId>
    <artifactId>order-service</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>order-service</name>
    <description>Servicio de órdenes para procesamiento de pedidos</description>

    <properties>
        <java.version>21</java.version>
        <aws.sdk.version>2.28.16</aws.sdk.version>
    </properties>

    <dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>software.amazon.awssdk</groupId>
                <artifactId>bom</artifactId>
                <version>${aws.sdk.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
        </dependencies>
    </dependencyManagement>

    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-validation</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-actuator</artifactId>
        </dependency>
        <dependency>
            <groupId>org.postgresql</groupId>
            <artifactId>postgresql</artifactId>
            <scope>runtime</scope>
        </dependency>
        <dependency>
            <groupId>software.amazon.awssdk</groupId>
            <artifactId>sqs</artifactId>
        </dependency>
        <dependency>
            <groupId>software.amazon.awssdk</groupId>
            <artifactId>sns</artifactId>
        </dependency>
        <dependency>
            <groupId>software.amazon.awssdk</groupId>
            <artifactId>dynamodb</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>org.mockito</groupId>
            <artifactId>mockito-core</artifactId>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>
</project>

// === ARCHIVO: api/src/main/java/com/pragma/orderservice/OrderserviceApplication.java ===
package com.pragma.orderservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableAsync;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.dynamodb.DynamoDbAsyncClient;
import software.amazon.awssdk.services.sns.SnsAsyncClient;
import software.amazon.awssdk.services.sqs.SqsAsyncClient;

import java.net.URI;
import java.util.Optional;

@SpringBootApplication
@EnableAsync
@EnableConfigurationProperties
public class OrderserviceApplication {

    private final AwsProperties awsProperties;

    public OrderserviceApplication(AwsProperties awsProperties) {
        this.awsProperties = awsProperties;
        validateAwsProperties();
    }

    public static void main(String[] args) {
        SpringApplication.run(OrderserviceApplication.class, args);
    }

    @Bean
    public DynamoDbAsyncClient dynamoDbAsyncClient() {
        return DynamoDbAsyncClient.builder()
                .region(Region.of(awsProperties.region()))
                .credentialsProvider(StaticCredentialsProvider.create(
                        AwsBasicCredentials.create(awsProperties.accessKey(), awsProperties.secretKey())
                ))
                .endpointOverride(URI.create(awsProperties.dynamodbEndpoint()))
                .build();
    }

    @Bean
    public SnsAsyncClient snsAsyncClient() {
        return SnsAsyncClient.builder()
                .region(Region.of(awsProperties.region()))
                .credentialsProvider(StaticCredentialsProvider.create(
                        AwsBasicCredentials.create(awsProperties.accessKey(), awsProperties.secretKey())
                ))
                .endpointOverride(URI.create(awsProperties.snsEndpoint()))
                .build();
    }

    @Bean
    public SqsAsyncClient sqsAsyncClient() {
        return SqsAsyncClient.builder()
                .region(Region.of(awsProperties.region()))
                .credentialsProvider(StaticCredentialsProvider.create(
                        AwsBasicCredentials.create(awsProperties.accessKey(), awsProperties.secretKey())
                ))
                .endpointOverride(URI.create(awsProperties.sqsEndpoint()))
                .build();
    }

    private void validateAwsProperties() {
        if (awsProperties.region() == null || awsProperties.region().isBlank()) {
            throw new IllegalStateException("AWS region must be configured");
        }
        if (awsProperties.accessKey() == null || awsProperties.accessKey().isBlank()) {
            throw new IllegalStateException("AWS access key must be configured");
        }
        if (awsProperties.secretKey() == null || awsProperties.secretKey().isBlank()) {
            throw new IllegalStateException("AWS secret key must be configured");
        }
        if (awsProperties.dynamodbEndpoint() == null || awsProperties.dynamodbEndpoint().isBlank()) {
            throw new IllegalStateException("DynamoDB endpoint must be configured");
        }
        if (awsProperties.snsEndpoint() == null || awsProperties.snsEndpoint().isBlank()) {
            throw new IllegalStateException("SNS endpoint must be configured");
        }
        if (awsProperties.sqsEndpoint() == null || awsProperties.sqsEndpoint().isBlank()) {
            throw new IllegalStateException("SQS endpoint must be configured");
        }
    }
}

record AwsProperties(
        String region,
        String accessKey,
        String secretKey,
        String dynamodbEndpoint,
        String snsEndpoint,
        String sqsEndpoint
) {}

// === ARCHIVO: api/src/main/resources/application.yml ===
spring:
  application:
    name: order-service
  datasource:
    url: jdbc:postgresql://localhost:5432/orderdb
    username: postgres
    password: postgres
    driver-class-name: org.postgresql.Driver
  jpa:
    database-platform: org.hibernate.dialect.PostgreSQLDialect
    hibernate:
      ddl-auto: update
    show-sql: true
    properties:
      hibernate:
        format_sql: true

server:
  port: 8080

management:
  endpoints:
    web:
      exposure:
        include: health,info,metrics

aws:
  region: ${AWS_REGION:us-east-1}
  access-key: ${AWS_ACCESS_KEY_ID:}
  secret-key: ${AWS_SECRET_ACCESS_KEY:}
  dynamodb-endpoint: ${AWS_DYNAMODB_ENDPOINT:http://localhost:4566}
  sns-endpoint: ${AWS_SNS_ENDPOINT:http://localhost:4566}
  sqs-endpoint: ${AWS_SQS_ENDPOINT:http://localhost:4566}

// === ARCHIVO: api/src/main/java/com/pragma/orderservice/domain/Order.java ===
package com.pragma.orderservice.domain;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

public class Order {
    private UUID id;

    @NotNull(message = "Customer ID cannot be null")
    private UUID customerId;

    @NotNull(message = "Order items cannot be null")
    @Size(min = 1, message = "Order must have at least one item")
    private List<OrderItem> items;

    @NotNull(message = "Order status cannot be null")
    private OrderStatus status;

    @NotNull(message = "Order date cannot be null")
    private LocalDateTime orderDate;

    @NotNull(message = "Total amount cannot be null")
    @Positive(message = "Total amount must be positive")
    private BigDecimal totalAmount;

    public Order() {
        this.orderDate = LocalDateTime.now();
        this.status = OrderStatus.CREATED;
    }

    public Order(UUID customerId, List<OrderItem> items) {
        this();
        this.customerId = customerId;
        this.items = items;
        this.totalAmount = calculateTotalAmount();
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public UUID getCustomerId() {
        return customerId;
    }

    public void setCustomerId(UUID customerId) {
        this.customerId = customerId;
    }

    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
        this.totalAmount = calculateTotalAmount();
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    private BigDecimal calculateTotalAmount() {
        return items.stream()
                .map(OrderItem::getTotalPrice)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    public enum OrderStatus {
        CREATED,
        PROCESSING,
        SHIPPED,
        DELIVERED,
        CANCELLED
    }

    public static class OrderItem {
        private UUID productId;

        @NotNull(message = "Quantity cannot be null")
        @Positive(message = "Quantity must be positive")
        private Integer quantity;

        @NotNull(message = "Unit price cannot be null")
        @Positive(message = "Unit price must be positive")
        private BigDecimal unitPrice;

        public OrderItem() {
        }

        public OrderItem(UUID productId, Integer quantity, BigDecimal unitPrice) {
            this.productId = productId;
            this.quantity = quantity;
            this.unitPrice = unitPrice;
        }

        public UUID getProductId() {
            return productId;
        }

        public void setProductId(UUID productId) {
            this.productId = productId;
        }

        public Integer getQuantity() {
            return quantity;
        }

        public void setQuantity(Integer quantity) {
            this.quantity = quantity;
        }

        public BigDecimal getUnitPrice() {
            return unitPrice;
        }

        public void setUnitPrice(BigDecimal unitPrice) {
            this.unitPrice = unitPrice;
        }

        public BigDecimal getTotalPrice() {
            return unitPrice.multiply(BigDecimal.valueOf(quantity));
        }
    }
}

// === ARCHIVO: api/src/main/java/com/pragma/orderservice/domain/OrderRepository.java ===
package com.pragma.orderservice.domain;

import java.util.Optional;
import java.util.UUID;

public interface OrderRepository {
    Order save(Order order);
    Optional<Order> findById(UUID id);
    void deleteById(UUID id);
}

// === ARCHIVO: api/src/main/java/com/pragma/orderservice/application/OrderService.java ===
package com.pragma.orderservice.application;

import com.pragma.orderservice.domain.Order;
import com.pragma.orderservice.domain.OrderRepository;
import com.pragma.orderservice.domain.Order.OrderItem;
import com.pragma.orderservice.domain.Order.OrderStatus;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.stereotype.Service;

@Service
public class OrderService {

    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public Order createOrder(UUID customerId, List<OrderItem> items) {
        if (customerId == null) {
            throw new IllegalArgumentException("El ID del cliente no puede ser nulo");
        }
        if (items == null || items.isEmpty()) {
            throw new IllegalArgumentException("La orden debe contener al menos un item");
        }

        Order order = new Order(customerId, new ArrayList<>(items));
        order.setStatus(OrderStatus.PENDING);
        order.setOrderDate(LocalDateTime.now());

        return orderRepository.save(order);
    }

    public Optional<Order> getOrderById(UUID orderId) {
        if (orderId == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }
        return orderRepository.findById(orderId);
    }

    public Order updateOrder(UUID orderId, UUID customerId, List<OrderItem> items, OrderStatus status) {
        if (orderId == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }

        Optional<Order> existingOrder = orderRepository.findById(orderId);
        if (existingOrder.isEmpty()) {
            throw new OrderNotFoundException("Orden no encontrada con ID: " + orderId);
        }

        Order order = existingOrder.get();
        if (customerId != null) {
            order.setCustomerId(customerId);
        }
        if (items != null && !items.isEmpty()) {
            order.setItems(new ArrayList<>(items));
        }
        if (status != null) {
            order.setStatus(status);
        }

        return orderRepository.save(order);
    }

    public void deleteOrder(UUID orderId) {
        if (orderId == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }

        Optional<Order> existingOrder = orderRepository.findById(orderId);
        if (existingOrder.isEmpty()) {
            throw new OrderNotFoundException("Orden no encontrada con ID: " + orderId);
        }

        orderRepository.deleteById(orderId);
    }

    public BigDecimal calculateOrderTotal(UUID orderId) {
        Optional<Order> orderOpt = orderRepository.findById(orderId);
        if (orderOpt.isEmpty()) {
            throw new OrderNotFoundException("Orden no encontrada con ID: " + orderId);
        }
        return orderOpt.get().getTotalAmount();
    }

    public static class OrderNotFoundException extends RuntimeException {
        public OrderNotFoundException(String message) {
            super(message);
        }
    }
}

// === ARCHIVO: api/src/main/java/com/pragma/orderservice/infrastructure/OrderController.java ===
package com.pragma.orderservice.infrastructure;


import com.pragma.orderservice.application.OrderNotFoundException;
import com.pragma.orderservice.application.OrderService;
import com.pragma.orderservice.domain.Order;
import com.pragma.orderservice.domain.Order.OrderItem;
import com.pragma.orderservice.domain.Order.OrderStatus;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/orders")
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @PostMapping
    public ResponseEntity<OrderResponseDTO> createOrder(@RequestBody OrderRequestDTO request) {
        try {
            List<OrderItem> items = request.items().stream()
                .map(itemDto -> new OrderItem(
                    itemDto.productId(),
                    itemDto.productName(),
                    itemDto.quantity(),
                    itemDto.unitPrice()
                ))
                .toList();

            Order createdOrder = orderService.createOrder(request.customerId(), items);
            return ResponseEntity.status(HttpStatus.CREATED).body(toResponseDTO(createdOrder));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<OrderResponseDTO> getOrder(@PathVariable UUID id) {
        return orderService.getOrderById(id)
            .map(order -> ResponseEntity.ok(toResponseDTO(order)))
            .orElse(ResponseEntity.notFound().build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<OrderResponseDTO> updateOrder(
            @PathVariable UUID id,
            @RequestBody OrderRequestDTO request) {
        try {
            List<OrderItem> items = request.items() != null ? request.items().stream()
                .map(itemDto -> new OrderItem(
                    itemDto.productId(),
                    itemDto.productName(),
                    itemDto.quantity(),
                    itemDto.unitPrice()
                ))
                .toList() : null;

            OrderStatus status = request.status() != null ?
                OrderStatus.valueOf(request.status()) : null;

            Order updatedOrder = orderService.updateOrder(id, request.customerId(), items, status);
            return ResponseEntity.ok(toResponseDTO(updatedOrder));
        } catch (OrderService.OrderNotFoundException e) {
            return ResponseEntity.notFound().build();
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteOrder(@PathVariable UUID id) {
        try {
            orderService.deleteOrder(id);
            return ResponseEntity.noContent().build();
        } catch (OrderService.OrderNotFoundException e) {
            return ResponseEntity.notFound().build();
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().build();
        }
    }

    private OrderResponseDTO toResponseDTO(Order order) {
        return new OrderResponseDTO(
            order.getId(),
            order.getCustomerId(),
            order.getItems().stream()
                .map(item -> new OrderItemDTO(
                    item.getProductId(),
                    item.getProductName(),
                    item.getQuantity(),
                    item.getUnitPrice()
                ))
                .toList(),
            order.getStatus().name(),
            order.getOrderDate(),
            order.getTotalAmount()
        );
    }

    public record OrderRequestDTO(
        UUID customerId,
        List<OrderItemDTO> items,
        String status
    ) {}

    public record OrderItemDTO(
        UUID productId,
        String productName,
        int quantity,
        BigDecimal unitPrice
    ) {}

    public record OrderResponseDTO(
        UUID id,
        UUID customerId,
        List<OrderItemDTO> items,
        String status,
        java.time.LocalDateTime orderDate,
        BigDecimal totalAmount
    ) {}

    @org.springframework.web.bind.annotation.ControllerAdvice
    public static class GlobalExceptionHandler {

        @org.springframework.web.bind.annotation.ExceptionHandler(OrderService.OrderNotFoundException.class)
        public ResponseEntity<String> handleOrderNotFound(OrderService.OrderNotFoundException ex) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(ex.getMessage());
        }

        @org.springframework.web.bind.annotation.ExceptionHandler(IllegalArgumentException.class)
        public ResponseEntity<String> handleIllegalArgument(IllegalArgumentException ex) {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }
    }
}

// === ARCHIVO: api/src/main/java/com/pragma/orderservice/infrastructure/AwsConfig.java ===
package com.pragma.orderservice.infrastructure;

import java.time.Duration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.DefaultCredentialsProvider;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.dynamodb.DynamoDbAsyncClient;
import software.amazon.awssdk.services.sns.SnsAsyncClient;
import software.amazon.awssdk.services.sqs.SqsAsyncClient;

@Configuration
public class AwsConfig {

    @Value("${AWS_REGION:us-east-1}")
    private String awsRegion;

    @Value("${AWS_ACCESS_KEY_ID:}")
    private String accessKeyId;

    @Value("${AWS_SECRET_ACCESS_KEY:}")
    private String secretAccessKey;

    @Bean
    public SqsAsyncClient sqsAsyncClient() {
        return SqsAsyncClient.builder()
            .region(Region.of(awsRegion))
            .credentialsProvider(buildCredentialsProvider())
            .endpointOverride(getEndpointOverride("sqs"))
            .build();
    }

    @Bean
    public SnsAsyncClient snsAsyncClient() {
        return SnsAsyncClient.builder()
            .region(Region.of(awsRegion))
            .credentialsProvider(buildCredentialsProvider())
            .endpointOverride(getEndpointOverride("sns"))
            .build();
    }

    @Bean
    public DynamoDbAsyncClient dynamoDbAsyncClient() {
        return DynamoDbAsyncClient.builder()
            .region(Region.of(awsRegion))
            .credentialsProvider(buildCredentialsProvider())
            .endpointOverride(getEndpointOverride("dynamodb"))
            .build();
    }

    private software.amazon.awssdk.auth.credentials.AwsCredentialsProvider buildCredentialsProvider() {
        if (accessKeyId != null && !accessKeyId.isBlank() && secretAccessKey != null && !secretAccessKey.isBlank()) {
            return StaticCredentialsProvider.create(
                AwsBasicCredentials.create(accessKeyId, secretAccessKey)
            );
        }
        return DefaultCredentialsProvider.create();
    }

    private java.net.URI getEndpointOverride(String service) {
        String localStackHost = System.getenv("LOCALSTACK_HOST");
        if (localStackHost != null && !localStackHost.isBlank()) {
            String port = System.getenv("LOCALSTACK_EDGE_PORT");
            String portValue = (port != null && !port.isBlank()) ? port : "4566";
            return java.net.URI.create(String.format("http://%s:%s", localStackHost, portValue));
        }
        return null;
    }

    @Bean
    public SqsProducerService sqsProducerService(SqsAsyncClient sqsAsyncClient) {
        return new SqsProducerService(sqsAsyncClient);
    }

    @Bean
    public SnsProducerService snsProducerService(SnsAsyncClient snsAsyncClient) {
        return new SnsProducerService(snsAsyncClient);
    }

    public static class SqsProducerService {
        private final SqsAsyncClient sqsClient;

        public SqsProducerService(SqsAsyncClient sqsClient) {
            this.sqsClient = sqsClient;
        }

        public void sendMessage(String queueUrl, String messageBody) {
            software.amazon.awssdk.services.sqs.model.SendMessageRequest request =
                software.amazon.awssdk.services.sqs.model.SendMessageRequest.builder()
                    .queueUrl(queueUrl)
                    .messageBody(messageBody)
                    .delaySeconds(Duration.ofSeconds(0))
                    .build();

            sqsClient.sendMessage(request);
        }
    }

    public static class SnsProducerService {
        private final SnsAsyncClient snsClient;

        public SnsProducerService(SnsAsyncClient snsClient) {
            this.snsClient = snsClient;
        }

        public void publish(String topicArn, String message) {
            software.amazon.awssdk.services.sns.model.PublishRequest request =
                software.amazon.awssdk.services.sns.model.PublishRequest.builder()
                    .topicArn(topicArn)
                    .message(message)
                    .build();

            snsClient.publish(request);
        }
    }
}

// === ARCHIVO: api/src/main/java/com/pragma/orderservice/infrastructure/persistence/OrderEntity.java ===
package com.pragma.orderservice.infrastructure.persistence;

import com.pragma.orderservice.domain.Order;
import com.pragma.orderservice.domain.Order.OrderItem;
import com.pragma.orderservice.domain.Order.OrderStatus;
import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "orders")
public class OrderEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "customer_id", nullable = false)
    private UUID customerId;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    private List<OrderItemEntity> items = new ArrayList<>();

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private OrderStatus status;

    @Column(name = "order_date", nullable = false)
    private LocalDateTime orderDate;

    @Column(name = "total_amount", nullable = false, precision = 19, scale = 2)
    private BigDecimal totalAmount;

    public OrderEntity() {
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public UUID getCustomerId() {
        return customerId;
    }

    public void setCustomerId(UUID customerId) {
        this.customerId = customerId;
    }

    public List<OrderItemEntity> getItems() {
        return items;
    }

    public void setItems(List<OrderItemEntity> items) {
        this.items = items;
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public static OrderEntity fromDomain(Order order) {
        OrderEntity entity = new OrderEntity();
        entity.setId(order.getId());
        entity.setCustomerId(order.getCustomerId());
        entity.setStatus(order.getStatus());
        entity.setOrderDate(order.getOrderDate());
        entity.setTotalAmount(order.getTotalAmount());
        
        if (order.getItems() != null) {
            List<OrderItemEntity> itemEntities = new ArrayList<>();
            for (OrderItem item : order.getItems()) {
                OrderItemEntity itemEntity = OrderItemEntity.fromDomain(item, entity);
                itemEntities.add(itemEntity);
            }
            entity.setItems(itemEntities);
        }
        
        return entity;
    }

    public Order toDomain() {
        Order order = new Order();
        order.setId(this.id);
        order.setCustomerId(this.customerId);
        order.setStatus(this.status);
        order.setOrderDate(this.orderDate);
        order.setTotalAmount(this.totalAmount);
        
        if (this.items != null) {
            List<OrderItem> orderItems = new ArrayList<>();
            for (OrderItemEntity itemEntity : this.items) {
                orderItems.add(itemEntity.toDomain());
            }
            order.setItems(orderItems);
        }
        
        return order;
    }
}

// === ARCHIVO: api/src/main/java/com/pragma/orderservice/infrastructure/persistence/OrderItemEntity.java ===
package com.pragma.orderservice.infrastructure.persistence;

import com.pragma.orderservice.domain.Order.OrderItem;
import jakarta.persistence.*;
import java.math.BigDecimal;
import java.util.UUID;

@Entity
@Table(name = "order_items")
public class OrderItemEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id", nullable = false)
    private OrderEntity order;

    @Column(name = "product_id", nullable = false)
    private UUID productId;

    @Column(nullable = false)
    private Integer quantity;

    @Column(name = "unit_price", nullable = false, precision = 19, scale = 2)
    private BigDecimal unitPrice;

    @Column(name = "subtotal", nullable = false, precision = 19, scale = 2)
    private BigDecimal subtotal;

    public OrderItemEntity() {
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public OrderEntity getOrder() {
        return order;
    }

    public void setOrder(OrderEntity order) {
        this.order = order;
    }

    public UUID getProductId() {
        return productId;
    }

    public void setProductId(UUID productId) {
        this.productId = productId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public BigDecimal getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }

    public static OrderItemEntity fromDomain(OrderItem item, OrderEntity orderEntity) {
        OrderItemEntity entity = new OrderItemEntity();
        entity.setId(item.getId());
        entity.setProductId(item.getProductId());
        entity.setQuantity(item.getQuantity());
        entity.setUnitPrice(item.getUnitPrice());
        entity.setSubtotal(item.getSubtotal());
        entity.setOrder(orderEntity);
        return entity;
    }

    public OrderItem toDomain() {
        OrderItem item = new OrderItem();
        item.setId(this.id);
        item.setProductId(this.productId);
        item.setQuantity(this.quantity);
        item.setUnitPrice(this.unitPrice);
        item.setSubtotal(this.subtotal);
        return item;
    }
}

// === ARCHIVO: api/src/main/java/com/pragma/orderservice/infrastructure/OrderRepositoryImpl.java ===
package com.pragma.orderservice.infrastructure;

import com.pragma.orderservice.domain.Order;
import com.pragma.orderservice.domain.OrderRepository;
import com.pragma.orderservice.infrastructure.persistence.OrderEntity;
import com.pragma.orderservice.infrastructure.persistence.OrderRepositoryJpa;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public class OrderRepositoryImpl implements OrderRepository {

    private final OrderRepositoryJpa orderRepositoryJpa;

    public OrderRepositoryImpl(OrderRepositoryJpa orderRepositoryJpa) {
        this.orderRepositoryJpa = orderRepositoryJpa;
    }

    @Override
    public Order save(Order order) {
        OrderEntity entity = OrderEntity.fromDomain(order);
        OrderEntity savedEntity = orderRepositoryJpa.save(entity);
        return savedEntity.toDomain();
    }

    @Override
    public Optional<Order> findById(UUID id) {
        return orderRepositoryJpa.findById(id).map(OrderEntity::toDomain);
    }

    @Override
    public void deleteById(UUID id) {
        orderRepositoryJpa.deleteById(id);
    }
}

// === ARCHIVO: api/src/main/java/com/pragma/orderservice/infrastructure/persistence/OrderRepositoryJpa.java ===
package com.pragma.orderservice.infrastructure.persistence;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface OrderRepositoryJpa extends JpaRepository<OrderEntity, UUID> {
}

// === ARCHIVO: api/src/test/java/com/pragma/orderservice/application/OrderServiceTest.java ===
package com.pragma.orderservice.application;

import com.pragma.orderservice.domain.Order;
import com.pragma.orderservice.domain.Order.OrderItem;
import com.pragma.orderservice.domain.Order.OrderStatus;
import com.pragma.orderservice.domain.OrderRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class OrderServiceTest {

    @Mock
    private OrderRepository orderRepository;

    @InjectMocks
    private OrderService orderService;

    private Order testOrder;
    private UUID orderId;
    private UUID customerId;

    @BeforeEach
    void setUp() {
        orderId = UUID.randomUUID();
        customerId = UUID.randomUUID();
        
        List<OrderItem> items = new ArrayList<>();
        OrderItem item = new OrderItem();
        item.setId(UUID.randomUUID());
        item.setProductId(UUID.randomUUID());
        item.setQuantity(2);
        item.setUnitPrice(new BigDecimal("25.00"));
        item.setSubtotal(new BigDecimal("50.00"));
        items.add(item);
        
        testOrder = new Order(customerId, items);
        testOrder.setId(orderId);
        testOrder.setStatus(OrderStatus.PENDING);
        testOrder.setOrderDate(LocalDateTime.now());
    }

    @Test
    void createOrder_ShouldReturnOrder_WhenValidOrderProvided() {
        when(orderRepository.save(any(Order.class))).thenReturn(testOrder);

        Order result = orderService.createOrder(testOrder);

        assertNotNull(result);
        assertEquals(orderId, result.getId());
        assertEquals(customerId, result.getCustomerId());
        assertEquals(OrderStatus.PENDING, result.getStatus());
        verify(orderRepository, times(1)).save(any(Order.class));
    }

    @Test
    void createOrder_ShouldThrowException_WhenOrderIsNull() {
        assertThrows(IllegalArgumentException.class, () -> orderService.createOrder(null));
        verify(orderRepository, never()).save(any(Order.class));
    }

    @Test
    void getOrder_ShouldReturnOrder_WhenOrderExists() {
        when(orderRepository.findById(orderId)).thenReturn(Optional.of(testOrder));

        Optional<Order> result = orderService.getOrder(orderId);

        assertTrue(result.isPresent());
        assertEquals(orderId, result.get().getId());
        verify(orderRepository, times(1)).findById(orderId);
    }

    @Test
    void getOrder_ShouldReturnEmpty_WhenOrderDoesNotExist() {
        UUID nonExistentId = UUID.randomUUID();
        when(orderRepository.findById(nonExistentId)).thenReturn(Optional.empty());

        Optional<Order> result = orderService.getOrder(nonExistentId);

        assertFalse(result.isPresent());
        verify(orderRepository, times(1)).findById(nonExistentId);
    }

    @Test
    void updateOrder_ShouldUpdateOrder_WhenOrderExists() {
        Order updatedOrder = new Order(customerId, testOrder.getItems());
        updatedOrder.setId(orderId);
        updatedOrder.setStatus(OrderStatus.CONFIRMED);
        updatedOrder.setOrderDate(LocalDateTime.now());
        
        when(orderRepository.findById(orderId)).thenReturn(Optional.of(testOrder));
        when(orderRepository.save(any(Order.class))).thenReturn(updatedOrder);

        Order result = orderService.updateOrder(orderId, updatedOrder);

        assertNotNull(result);
        assertEquals(OrderStatus.CONFIRMED, result.getStatus());
        verify(orderRepository, times(1)).findById(orderId);
        verify(orderRepository, times(1)).save(any(Order.class));
    }

    @Test
    void updateOrder_ShouldThrowException_WhenOrderNotFound() {
        UUID nonExistentId = UUID.randomUUID();
        when(orderRepository.findById(nonExistentId)).thenReturn(Optional.empty());

        assertThrows(RuntimeException.class, () -> orderService.updateOrder(nonExistentId, testOrder));
        verify(orderRepository, times(1)).findById(nonExistentId);
        verify(orderRepository, never()).save(any(Order.class));
    }

    @Test
    void deleteOrder_ShouldCallRepository_WhenOrderExists() {
        when(orderRepository.findById(orderId)).thenReturn(Optional.of(testOrder));
        doNothing().when(orderRepository).deleteById(orderId);

        orderService.deleteOrder(orderId);

        verify(orderRepository, times(1)).findById(orderId);
        verify(orderRepository, times(1)).deleteById(orderId);
    }

    @Test
    void deleteOrder_ShouldThrowException_WhenOrderNotFound() {
        UUID nonExistentId = UUID.randomUUID();
        when(orderRepository.findById(nonExistentId)).thenReturn(Optional.empty());

        assertThrows(RuntimeException.class, () -> orderService.deleteOrder(nonExistentId));
        verify(orderRepository, times(1)).findById(nonExistentId);
        verify(orderRepository, never()).deleteById(any(UUID.class));
    }

    @Test
    void createOrder_ShouldCalculateTotalAmount() {
        List<OrderItem> items = new ArrayList<>();
        
        OrderItem item1 = new OrderItem();
        item1.setId(UUID.randomUUID());
        item1.setProductId(UUID.randomUUID());
        item1.setQuantity(3);
        item1.setUnitPrice(new BigDecimal("10.00"));
        item1.setSubtotal(new BigDecimal("30.00"));
        items.add(item1);
        
        OrderItem item2 = new OrderItem();
        item2.setId(UUID.randomUUID());
        item2.setProductId(UUID.randomUUID());
        item2.setQuantity(2);
        item2.setUnitPrice(new BigDecimal("15.00"));
        item2.setSubtotal(new BigDecimal("30.00"));
        items.add(item2);
        
        Order orderWithItems = new Order(customerId, items);
        
        when(orderRepository.save(any(Order.class))).thenAnswer(invocation -> {
            Order savedOrder = invocation.getArgument(0);
            return savedOrder;
        });

        Order result = orderService.createOrder(orderWithItems);

        assertNotNull(result);
        assertEquals(new BigDecimal("60.00"), result.getTotalAmount());
    }

    @Test
    void getOrder_ShouldReturnOrderWithItems_WhenOrderHasItems() {
        when(orderRepository.findById(orderId)).thenReturn(Optional.of(testOrder));

        Optional<Order> result = orderService.getOrder(orderId);

        assertTrue(result.isPresent());
        assertNotNull(result.get().getItems());
        assertFalse(result.get().getItems().isEmpty());
        assertEquals(1, result.get().getItems().size());
    }
}
```
