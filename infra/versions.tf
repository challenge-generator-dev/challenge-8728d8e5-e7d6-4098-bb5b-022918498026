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