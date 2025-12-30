resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  # Enable Autopilot mode for a hands-off, fully managed cluster
  enable_autopilot = true

  # Network configuration to place the cluster in our custom VPC
  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  # IP allocation policy to use the secondary ranges from our subnet
  ip_allocation_policy {
    cluster_secondary_range_name  = "pods-range"
    services_secondary_range_name = "services-range"
  }

  # Deletion protection should be enabled for production environments
  deletion_protection = var.deletion_protection
}