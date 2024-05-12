output "vpc_network_self_link" {
  value = google_compute_network.vpc_network.self_link
}

output "vpc_subnetwork_self_link" {
  value = data.google_compute_subnetwork.vpc_subnetwork.self_link
}