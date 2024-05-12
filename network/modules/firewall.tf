module "firewall_rules" {
  source = "git@github.com:terraform-google-modules/terraform-google-network.git//modules/firewall-rules?ref=v9.1.0"

  project_id      = var.project_id
  network_name    = google_compute_network.vpc_network.name

  ingress_rules = [{
    name        = "allow-ssh-rdp-winrm"
    direction   = "INGRESS"

    source_ranges   = ["0.0.0.0/0"]
    source_tags     = ["allow-ssh-rdp-winrm"]

    log_config = {
    metadata = "INCLUDE_ALL_METADATA"
    }

    allow = [{
    protocol = "tcp"
    ports    = ["22", "3389", "5986"]
    }]
}]
}