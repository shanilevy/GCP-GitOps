locals {
  network = element(split("-", var.var_subnet), 0)
}

#
resource "google_compute_firewall" "allow-http" {
  name    = "${local.network}-allow-http"
  network = local.network
  project = var.var_project
  
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  
  target_tags   = ["http-server"]
  source_ranges = ["0.0.0.0/0"]
}
