resource "google_container_cluster" "primary" {
  name                     = "gke-prod"
  location                 = "southamerica-east1"
  network                  = google_compute_network.vpc.id
  subnetwork               = google_compute_subnetwork.private.id
  remove_default_node_pool = true
  initial_node_count       = 1
  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
  }
}

resource "google_container_node_pool" "primary" {
  name       = "primary-pool"
  cluster    = google_container_cluster.primary.name
  location   = "southamerica-east1"
  node_count = 3
  node_config {
    machine_type = "e2-standard-4"
    tags         = ["gke-node"]
  }
}
