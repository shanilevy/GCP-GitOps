locals {
  env = "prod"
}

module "vpc" {
  source = "git::https://github.com/shanilevy/GCP-GitOps.git//modules/vpc?ref=prod"
  var_project = var.var_project
  var_region  = var.var_region
  var_env     = local.env
}

module "http_server" {
  source = "git::https://github.com/shanilevy/GCP-GitOps.git//modules/http_server?ref=prod"
  var_project = var.var_project
  var_machine_name = var.var_machine_name
  var_machine_size = var.var_machine_size
  var_subnet  = module.vpc.subnet
}

module "firewall" {
  source = "git::https://github.com/shanilevy/GCP-GitOps.git//modules/firewall?ref=prod"
  var_project = var.var_project
  var_subnet  = module.vpc.subnet
}
