resource "google_compute_firewall" "allow_lb_health_check" {
  name          = "allow-lb-health-check"
  network       = google_compute_network.vpc.id
  direction     = "INGRESS"
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
  target_tags = ["gke-node"]
}

resource "google_compute_firewall" "allow_iap_ssh" {
  name          = "allow-iap-ssh"
  network       = google_compute_network.vpc.id
  direction     = "INGRESS"
  source_ranges = ["35.235.240.0/20"]
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}
