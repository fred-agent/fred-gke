variable "project_id" {
  description = "The Google Cloud project ID to deploy the resources in."
  type        = string
}

variable "region" {
  description = "The Google Cloud region to deploy the resources in, e.g., 'europe-west9'."
  type        = string
  default     = "europe-west9"
}

variable "cluster_name" {
  description = "The name for the GKE Autopilot cluster."
  type        = string
  default     = "gke-autopilot-playground"
}

variable "network_name" {
  description = "The name for the VPC Network. This will be used as a base for the network and subnetwork resources."
  type        = string
}

variable "deletion_protection" {
  description = "If true, prevents the cluster from being accidentally deleted."
  type        = bool
  default     = false
}

variable "subnet_ip_cidr_range" {
  description = "The primary IP address range for the GKE subnetwork."
  type        = string
}

variable "pods_ip_cidr_range" {
  description = "The secondary IP address range for the GKE Pods."
  type        = string
}

variable "services_ip_cidr_range" {
  description = "The secondary IP address range for the GKE Services."
  type        = string
}

variable "project_apis" {
  description = "A list of Google Cloud APIs to enable in the project."
  type        = list(string)
  default = [
    "compute.googleapis.com",
    "container.googleapis.com"
  ]
}