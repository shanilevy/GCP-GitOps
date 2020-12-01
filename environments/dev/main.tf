locals {
  env = "dev"
}

module "vpc" {
  #source  = "../../modules/vpc"
  source = "git::https://github.com/shanilevy/GCP-GitOps.git?ref=dev//modules/vpc"
  var_project = var.var_project
  var_region  = var.var_region
  var_env     = local.env
}

module "http_server" {
  #source  = "../../modules/http_server"
  source = "git::https://github.com/shanilevy/GCP-GitOps.git?ref=dev//modules/http_server"
  var_project = var.var_project
  var_machine_name = var.var_machine_name
  var_machine_size = var.var_machine_size
  var_subnet  = module.vpc.subnet
}

module "firewall" {
  #source  = "../../modules/firewall"
  source = "git::https://github.com/shanilevy/GCP-GitOps.git?ref=dev//modules/firewall"
  var_project = var.var_project
  var_subnet  = module.vpc.subnet
}
