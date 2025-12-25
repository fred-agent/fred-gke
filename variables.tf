variable "project_id" {
  description = "L'ID du projet Google Cloud"
  type        = string
}

variable "region" {
  description = "La région GCP (ex: europe-west9)"
  type        = string
  default     = "europe-west9"
}

variable "cluster_name" {
  description = "Le nom du cluster GKE"
  type        = string
  default     = "gke-autopilot-demo"
}