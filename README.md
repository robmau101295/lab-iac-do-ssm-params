# lab-iac-do-ssm-params

Consumidor piloto de `lab-tpl-do-pipeline-infrastructure-devops`. Crea parámetros de SSM
Parameter Store por ambiente (gratis en el tier Standard):

```
/lab-migracion/<ambiente>/greeting      String
/lab-migracion/<ambiente>/log-level     String
/lab-migracion/<ambiente>/db-password   SecureString
```

| Archivo | Qué es |
|---|---|
| `config/across/ssm.tfvars` | Valores con tokens `#{ENVIRONMENT}#`, `#{LOG_LEVEL}#`, `#{DB_PASSWORD}#` |
| `config/r1/backend.hcl` | Backend S3 (state por workspace: `env:/<ambiente>/lab-iac-do-ssm-params/terraform.tfstate`) |
| `.github/workflows/terraform-r1.yml` | Pipeline nuevo (usa la plantilla) |
| `.github/workflows/terraform-analysis.yml` | Análisis en PR |
| `.github/workflows/legacy-simulado.yml` | Simula el pipeline viejo de Azure |

Antes de usarlo: reemplaza `robmau101295` y `590183926189` (ver el manual del lab).
