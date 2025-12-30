output "cluster_name" {
  description = "The name of the GKE cluster."
  value       = google_container_cluster.primary.name
}

output "cluster_location" {
  description = "The region where the GKE cluster is located."
  value       = google_container_cluster.primary.location
}

output "get_credentials_command" {
  description = "The gcloud command to run to connect kubectl to the cluster."
  value       = "gcloud container clusters get-credentials ${google_container_cluster.primary.name} --region ${google_container_cluster.primary.location} --project ${var.project_id}"
}