terraform {
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  # La configuración real llega con -backend-config=config/r1/backend.hcl
  backend "s3" {}
}
