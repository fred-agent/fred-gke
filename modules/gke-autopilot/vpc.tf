# Create the Virtual Private Cloud (VPC) network
resource "google_compute_network" "vpc" {
  name                    = var.network_name
  auto_create_subnetworks = false

  depends_on = [google_project_service.apis]
}

# Create the subnetwork with secondary IP ranges for GKE
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.network_name}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = var.subnet_ip_cidr_range

  # IP range for the Pods
  secondary_ip_range {
    range_name    = "pods-range"
    ip_cidr_range = var.pods_ip_cidr_range
  }

  # IP range for the Services
  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = var.services_ip_cidr_range
  }
}