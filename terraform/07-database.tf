resource "google_sql_database_instance" "postgres" {
  name             = "prod-postgres"
  database_version = "POSTGRES_15"
  region           = "southamerica-east1"
  settings {
    tier = "db-custom-4-16384"
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.vpc.id
    }
  }
}

resource "google_sql_database" "app_db" {
  name     = "app"
  instance = google_sql_database_instance.postgres.name
}
