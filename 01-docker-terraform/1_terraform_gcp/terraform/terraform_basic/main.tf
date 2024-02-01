terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

provider "google" {
  # Credentials only needs to be set if you do not have the GOOGLE_APPLICATION_CREDENTIALS set
  #  credentials = 
  credentials = "/Users/leonard504s/leonard-github/DTC-DEZ/01-docker-terraform/1_terraform_gcp/terraform/keys/my-cred.json"
  project     = "terraform-demo-413007"
  region      = "asia-east1"
}

resource "google_storage_bucket" "data-lake-bucket" {
  name     = "terraform-demo-413007-terra-bucket"
  location = "ASIA"

  # Optional, but recommended settings:
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "AbortIncompleteMultipartUpload"
    }
    condition {
      age = 30 // days
    }
  }

  force_destroy = true
}


resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id = "demo_dataset"
  location   = "asia-east1"
  # project    = "<Your Project ID>"
}