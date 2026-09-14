resource "google_storage_bucket" "assets" {
  name          = "prod-app-assets"
  location      = "SOUTHAMERICA-EAST1"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}
