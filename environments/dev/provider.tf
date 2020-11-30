provider "google" {
  version     = "3.12.0"
  project     = var.var_project
  region      = var.var_region
  credentials = "${file("gs://shani-project-bucket/terraform-admin.json")}"
}
