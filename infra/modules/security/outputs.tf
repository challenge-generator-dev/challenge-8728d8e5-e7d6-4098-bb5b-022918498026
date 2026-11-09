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