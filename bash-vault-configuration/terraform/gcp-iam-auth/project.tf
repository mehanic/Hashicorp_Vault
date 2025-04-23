variable "billing_account" {
  description = "GCP Billing Account ID"
  type        = string
}

variable "org_id" {
  description = "GCP Organization ID"
  type        = string
}

resource "random_id" "id" {
  byte_length = 1
  prefix      = "vaultguides-gcpiam-"
}

resource "google_project" "vault_gcp_iam_demo" {
  name            = "vault-gcp-iam-demo"
  project_id      = random_id.id.hex
  billing_account = var.billing_account
  org_id          = var.org_id
}

resource "google_project_service" "iam" {
  project = google_project.vault_gcp_iam_demo.project_id
  service = "iam.googleapis.com"
}

resource "google_project_service" "iamcredentials" {
  project = google_project.vault_gcp_iam_demo.project_id
  service = "iamcredentials.googleapis.com"
}

output "project_id" {
  value       = google_project.vault_gcp_iam_demo.project_id
  description = "The ID of the created GCP project"
}


---- // to reduce

resource "google_project_service" "required" {
  for_each = toset([
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
  ])
  project = google_project.vault_gcp_iam_demo.project_id
  service = each.key
}