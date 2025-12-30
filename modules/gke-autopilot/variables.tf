variable "project_id" {
  description = "the project id"
  type        = string
}

variable "region" {
  description = "The region e.g. europe-west9"
  type        = string
  default     = "europe-west9"
}

variable "cluster_name" {
  description = "the nameof the gke cluster"
  type        = string
  default     = "gke-autopilot-playground"
}

variable "network_name" {
  description = "A name for the VPC network."
  type        = string
}