terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.0.0"
    }
  }
}

provider "google" {
  project = "data-eng-zoomcamp-485022"
  region  = "southamerica-east1"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "data-eng-zoomcamp-485022-fbucket"
  location      = "southamerica-east1"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}