include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_parent_terragrunt_dir()}//network/modules"
}

locals {
  env_vars = yamldecode(file(find_in_parent_folders("env.yaml")))
}

inputs = {

  # Project Inputs
  env             = local.env_vars.env
  project_id      = local.env_vars.project_id
  region          = local.env_vars.region
  service_account = local.env_vars.service_account

  # Network Inputs
  network = "main-vpc"

}