resource "google_service_account" "vaultadmin" {
  project      = google_project.vault_gcp_iam_demo.project_id
  account_id   = "vaultadmin"
  display_name = "Vault Admin for IAM"
}

resource "google_service_account" "alice" {
  project      = google_project.vault_gcp_iam_demo.project_id
  account_id   = "alice-account"
  display_name = "Alice - Has access to things"
}

resource "google_service_account" "bob" {
  project      = google_project.vault_gcp_iam_demo.project_id
  account_id   = "bob-account"
  display_name = "Bob - Does not have access to things"
}

resource "google_project_iam_member" "iam_admin_role" {
  project = google_project.vault_gcp_iam_demo.project_id
  role    = "roles/iam.serviceAccountKeyAdmin"
  member  = "serviceAccount:${google_service_account.vaultadmin.email}"
}

resource "google_project_iam_member" "sign_jwt_alice" {
  project = google_project.vault_gcp_iam_demo.project_id
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "serviceAccount:${google_service_account.alice.email}"
}

resource "google_project_iam_member" "sign_jwt_bob" {
  project = google_project.vault_gcp_iam_demo.project_id
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "serviceAccount:${google_service_account.bob.email}"
}

output "alice_account_email" {
  description = "Email address of Alice's service account"
  value       = google_service_account.alice.email
}

output "bob_account_email" {
  description = "Email address of Bob's service account"
  value       = google_service_account.bob.email
}
