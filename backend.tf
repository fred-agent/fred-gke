terraform {
  backend "gcs" {
    bucket  = "fred-playground-tf-state"
    prefix  = "terraform/state"
  }
}