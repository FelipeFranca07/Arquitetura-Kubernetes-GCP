resource "google_compute_health_check" "gke_health" {
  name               = "gke-health-check"
  check_interval_sec = 10
  http_health_check {
    port         = 8080
    request_path = "/health"
  }
}

resource "google_compute_backend_service" "app_backend" {
  name          = "app-backend"
  protocol      = "HTTP"
  health_checks = [google_compute_health_check.gke_health.id]
  backend {
    group = google_container_node_pool.primary.instance_group_urls[0]
  }
}

resource "google_compute_forwarding_rule" "app_lb" {
  name                  = "app-lb"
  region                = "southamerica-east1"
  load_balancing_scheme = "EXTERNAL"
  backend_service       = google_compute_backend_service.app_backend.id
  port_range            = "80"
}
