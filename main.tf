provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      project     = "lab-migracion"
      environment = var.environment
      managed-by  = "terraform"
    }
  }
}

locals {
  prefix = "/lab-migracion/${var.environment}"
}

resource "aws_ssm_parameter" "settings" {
  for_each = var.settings

  name  = "${local.prefix}/${each.key}"
  type  = "String"
  value = each.value

  lifecycle {
    # Protege contra tokens de un ambiente aplicados en el workspace de otro.
    precondition {
      condition     = var.environment == terraform.workspace
      error_message = "environment (${var.environment}) no coincide con el workspace (${terraform.workspace})."
    }
  }
}

resource "aws_ssm_parameter" "db_password" {
  name  = "${local.prefix}/db-password"
  type  = "SecureString"
  value = var.db_password
}
