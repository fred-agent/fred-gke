// This is the terragrunt.hcl file for the dev GKE cluster.

// Include the root terragrunt.hcl file to inherit its configuration.
include "root" {
  path = find_in_parent_folders()
}

// Configure the Terraform module to use.
// This points to a module that defines the GKE Autopilot cluster.
// For now, we'll assume it's a local module, but it could be from the Terraform Registry.
terraform {
  source = "../../modules/gke-autopilot"
}

// Define the input variables for this specific (dev) environment.
inputs = {
  project_id   = "fred-playground"
  region       = "europe-west9"
  cluster_name = "gke-autopilot-dev"
  network_name = "gke-vpc-dev"
}