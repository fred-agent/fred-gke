// This is the terragrunt.hcl file for the dev GKE cluster.

// Include the root terragrunt.hcl file to inherit its configuration.
include "root" {
  path = find_in_parent_folders()
  expose = true
}

// Configure the Terraform module to use.
// This points to a module that defines the GKE Autopilot cluster.
// For now, we'll assume it's a local module, but it could be from the Terraform Registry.
terraform {
  source = "../../modules/gke-autopilot"
}

// Define the input variables for this specific (dev) environment.
inputs = {
  project_id          = include.root.locals.project_id
  region              = include.root.locals.region
  cluster_name        = "gke-autopilot-dev"
  network_name        = "gke-vpc-dev"
  deletion_protection = false // It's safe to disable deletion protection for dev
  subnet_ip_cidr_range = "10.10.0.0/24"
  pods_ip_cidr_range   = "10.20.0.0/16"
  services_ip_cidr_range = "10.30.0.0/20"
}