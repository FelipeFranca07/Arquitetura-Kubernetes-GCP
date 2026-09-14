resource "google_compute_subnetwork" "public" {
  name          = "subnet-public"
  network       = google_compute_network.vpc.id
  ip_cidr_range = "10.0.1.0/24"
  region        = "southamerica-east1"
}

resource "google_compute_subnetwork" "private" {
  name                     = "subnet-private"
  network                  = google_compute_network.vpc.id
  ip_cidr_range            = "10.0.2.0/24"
  region                   = "southamerica-east1"
  private_ip_google_access = true
}
