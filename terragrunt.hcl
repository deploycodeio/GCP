locals {
  env_vars = yamldecode(file(find_in_parent_folders("env.yaml")))
}

# Define the remote state configuration to use Google Cloud Storage (GCS)
remote_state {
  backend = "gcs"

  config = {
    bucket      = "${local.env_vars.project_id}-tf-state"                                                        # Your GCS bucket name without the gs:// prefix
    prefix      = "${path_relative_to_include()}/state"                                                          # Organize state files within the bucket
    credentials = "${get_parent_terragrunt_dir()}/..//secrets/gcp-credentials-${local.env_vars.project_id}.json" # Path to your Google Cloud credentials file
  }

  # Automatically generate a backend configuration file
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

# Generate a provider configuration block for Google Cloud
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
    provider "google" {
        project = "${local.env_vars.project_id}"
        region  = "us-central1"
        # Optionally specify the path to the credentials file
        # credentials = "${get_parent_terragrunt_dir()}/..//secrets/gcp-credentials-${local.env_vars.project_id}.json"
    }
EOF
}