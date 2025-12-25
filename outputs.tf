output "cluster_name" {
  description = "Nom du cluster GKE"
  value       = google_container_cluster.primary.name
}

output "cluster_location" {
  description = "Région du cluster"
  value       = google_container_cluster.primary.location
}

output "get_credentials_command" {
  description = "Commande pour se connecter au cluster"
  value       = "gcloud container clusters get-credentials ${google_container_cluster.primary.name} --region ${google_container_cluster.primary.location} --project ${var.project_id}"
}