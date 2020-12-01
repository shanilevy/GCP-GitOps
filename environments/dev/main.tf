locals {
  env = "dev"
}

module "vpc" {
  #source  = "../../modules/vpc"
  source = "github.com/shanilevy/GCP-GitOps//modules/vpc?ref=dev"
  var_project = var.var_project
  var_region  = var.var_region
  var_env     = local.env
}

module "http_server" {
  #source  = "../../modules/http_server"
  source = "github.com/shanilevy/GCP-GitOps//modules/http_server?ref=dev"
  var_project = var.var_project
  var_machine_name = var.var_machine_name
  var_machine_size = var.var_machine_size
  var_subnet  = module.vpc.subnet
}

module "firewall" {
  #source  = "../../modules/firewall"
  source = "github.com/shanilevy/GCP-GitOps//modules/firewall?ref=dev"
  var_project = var.var_project
  var_subnet  = module.vpc.subnet
}
