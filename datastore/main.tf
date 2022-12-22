terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
}

resource "google_storage_bucket" "bucket_1" {
  name = "excel-file-001"
  location = "US-WEST1"
}

resource "google_storage_bucket" "bucket_2" {
  name     = "code-file-001"
  location = "US-WEST1"
}

resource "google_storage_bucket_object" "archive" {
  name   = "index.zip"
  bucket = google_storage_bucket.bucket_2.name
  source = "D:\\Terraform\\index.zip"
}

resource "google_cloudfunctions_function" "function" {
  name        = "function-test"
  description = "My function"
  runtime     = "python37"

  available_memory_mb          = 256
  source_archive_bucket        = google_storage_bucket.bucket_2.name
  source_archive_object        = google_storage_bucket_object.archive.name

  event_trigger {
    event_type = "google.storage.object.finalize"
    resource = "excel-file-001"
  }

  entry_point                  = "hello_gcs"
  
}

