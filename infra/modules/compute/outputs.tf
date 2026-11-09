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