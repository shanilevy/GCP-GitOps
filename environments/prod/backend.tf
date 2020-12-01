terraform {
  backend "gcs" {
    bucket = "shanil-terraform-admin"
    prefix = "env/prod"
  }
}
