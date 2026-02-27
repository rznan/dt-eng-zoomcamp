terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.0.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.gcp_location
}

resource "google_storage_bucket" "demo-bucket" {
  name          = var.gcs_bucket_name
  location      = var.gcp_location
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


resource "google_bigquery_dataset" "default" {
  dataset_id = var.bg_dataset_name
  location = var.gcp_location
}


resource "google_bigquery_dataset" "ch3_pratice" {
  dataset_id = var.bg_dataset_for_dtwarehouse_pratice
  location = var.gcp_location
}


resource "google_bigquery_dataset" "dbt" {
  dataset_id = var.bg_dataset_for_dbt
  location = var.gcp_location
}