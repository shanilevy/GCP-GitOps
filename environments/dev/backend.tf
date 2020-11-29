terraform {
  backend "gcs" {
    bucket = "shanil-terraform-admin"
    prefix = "env/dev"
    credentials = "terraform-admin.json"
  }
}
