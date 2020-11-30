terraform {
 backend "gcs" {
   bucket  = "shanil-terraform-admin"
   prefix  = "terraform/state"
 }
}
