output "parameter_names" {
  description = "Parámetros creados en SSM"
  value       = concat([for p in aws_ssm_parameter.settings : p.name], [aws_ssm_parameter.db_password.name])
}
