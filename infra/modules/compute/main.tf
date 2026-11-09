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