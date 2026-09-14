resource "google_compute_network" "hub" {
  name                    = "vpc-hub"
  auto_create_subnetworks = false
}

resource "google_compute_network_peering" "prod_to_hub" {
  name         = "prod-to-hub"
  network      = google_compute_network.vpc.self_link
  peer_network = google_compute_network.hub.self_link
}

resource "google_compute_network_peering" "hub_to_prod" {
  name         = "hub-to-prod"
  network      = google_compute_network.hub.self_link
  peer_network = google_compute_network.vpc.self_link
}
