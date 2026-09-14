resource "google_firestore_database" "sessions" {
  name        = "(default)"
  location_id = "southamerica-east1"
  type        = "FIRESTORE_NATIVE"
}
