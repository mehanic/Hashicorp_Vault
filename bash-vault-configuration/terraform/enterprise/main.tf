provider "vault" {}

# Create 'finance' namespace
resource "vault_namespace" "finance" {
  path = "finance"
}

# Create 'engineering' namespace
resource "vault_namespace" "engineering" {
  path = "engineering"
}

# Create 'education' namespace
resource "vault_namespace" "education" {
  path = "education"
}

# Create 'education/training' namespace
resource "vault_namespace" "training" {
  namespace = vault_namespace.education.path
  path      = "training"
}

# Create 'education/training/vault_cloud' namespace
resource "vault_namespace" "vault_cloud" {
  namespace = vault_namespace.training.path_fq
  path      = "vault_cloud"
}

# Create 'education/training/boundary' namespace
resource "vault_namespace" "boundary" {
  namespace = vault_namespace.training.path_fq
  path      = "boundary"
}
