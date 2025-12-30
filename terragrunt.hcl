// This is the root terragrunt.hcl file.
// It contains the configuration that is shared across all environments.

// Define common variables for all environments in this project.
locals {
  project_id = "fred-playground"
  region     = "europe-west9"
}

// Configure the remote state backend.
// Terragrunt will automatically create the GCS bucket if it doesn't exist.
remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket   = "fredlab-playground-tf-state" // The GCS bucket you created
    location = local.region
    project = local.project_id
  }
}

// Configure the Google provider.
// Terragrunt will generate a provider.tf file in each module.
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "google" {
  project = "${local.project_id}"
  region  = "${local.region}"
}
EOF
}