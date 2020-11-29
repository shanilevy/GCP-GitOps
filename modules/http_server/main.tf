locals {
  network = element(split("-", var.var_subnet), 0)
}

resource "google_compute_instance" "http_server" {
  project      = var.var_project
  zone         = var.var_zone_1
  name         = var.var_machine_name
  machine_type = var.var_machine_size

  metadata_startup_script = "sudo apt-get update && sudo apt-get install apache2 -y && echo '<html><body><h1>Environment: local.network</h1></body></html>' | sudo tee /var/www/html/index.html"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork = var.var_subnet

    access_config {
      # Include this section to give the VM an external ip address
    }
  }

  # Apply the firewall rule to allow external IPs to access this instance
  tags = ["http-server"]
}
