module "bootstrap" {
  source         = "github.com/null0xeth/terraform_project_bootstrap"
  create_s3_stub = true
  root_path      = "../configuration"
  project_name   = "vault-dynamic-aws"
  resource_tags  = var.resource_tags
  provider_aws   = var.provider_aws
  s3_config      = var.s3_config
  ddb_global     = var.ddb_global
  ddb_config     = var.ddb_config

}

output "instructions" {
  value = module.bootstrap.info
}

###
