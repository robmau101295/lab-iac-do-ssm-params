variable "aws_region" {
  description = "Región de AWS"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Ambiente (llega por el token #{ENVIRONMENT}#)"
  type        = string
}

variable "settings" {
  description = "Parámetros de configuración no secretos"
  type        = map(string)
}

variable "db_password" {
  description = "Secreto de ejemplo (llega por el token #{DB_PASSWORD}#)"
  type        = string
  sensitive   = true

  # Si el token no tenía valor, replacetokens lo deja vacío: mejor fallar en el plan.
  validation {
    condition     = length(var.db_password) >= 8
    error_message = "db_password está vacío o es muy corto. ¿Falta el secreto DB_PASSWORD en el environment?"
  }
}
