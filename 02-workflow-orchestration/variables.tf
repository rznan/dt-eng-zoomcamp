variable "project" {
  description = "My project name"
  default     = "data-eng-zoomcamp-485022"
}

variable "gcp_location" {
  description = "My project location"
  default     = "southamerica-east1"
}

variable "gcp_region" {
  description = "My project region"
  default     = "southamerica-east1"
}

variable "bg_dataset_name" {
  description = "My bigquery dataset name"
  default     = "NYtaxiDataset"
}


variable "bg_dataset_for_dtwarehouse_pratice" {
  description = "My bigquery dataset name"
  default     = "NYtaxiDatasetCh3Pratice"
}

variable "bg_dataset_for_dbt" {
  description = "My bigquery dataset name"
  default     = "dbt_znan"
}

variable "gcs_bucket_name" {
  description = "My storage bucket name"
  default     = "nytaxibucket"
}

variable "gcs_storage_class" {
  description = "bucket storage class"
  default     = "STANDARD"
}
