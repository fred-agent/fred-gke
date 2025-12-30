# Enables the necessary APIs for the project.
# This ensures that the configuration is self-contained and can be applied
# to a new project without manual pre-configuration steps.
resource "google_project_service" "apis" {
  for_each = toset(var.project_apis)
  project  = var.project_id

  service                    = each.key
  disable_on_destroy         = false
}