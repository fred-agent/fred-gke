resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  # Activation du mode Autopilot
  enable_autopilot = true

  # Configuration Réseau
  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  # Configuration des IPs (Pods et Services)
  ip_allocation_policy {
    cluster_secondary_range_name  = "pods-range"
    services_secondary_range_name = "services-range"
  }

  # Protection contre la suppression (mettre à true pour la prod)
  deletion_protection = false
}