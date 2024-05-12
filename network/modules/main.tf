resource "google_compute_network" "vpc_network" {
  project                                   = var.project_id
  name                                      = var.network
  auto_create_subnetworks                   = true
}

data "google_compute_subnetwork" "vpc_subnetwork" {
  name = var.network
  region = var.region
}