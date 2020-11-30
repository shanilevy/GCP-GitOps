module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 2.5"
  project_id   = var.var_project
  network_name = var.var_env
  #region = var.var_region

  subnets = [
    {
      subnet_name   = "${var.var_env}-subnet-01"
      subnet_ip     = "10.${var.var_env == "dev" ? 10 : 20}.10.0/24"
      subnet_region = var.var_region
    },
  ]

  secondary_ranges = {
    "${var.var_env}-subnet-01" = []
  }
}
