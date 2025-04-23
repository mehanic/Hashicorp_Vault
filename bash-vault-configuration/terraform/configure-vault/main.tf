provider "vault" {}

#--------------------------------------
# Create 'admin/education' namespace
#--------------------------------------
resource "vault_namespace" "education" {
  path = "education"
}

#---------------------------------------------------
# Create 'admin/education/training' namespace
#---------------------------------------------------
resource "vault_namespace" "training" {
  depends_on = [vault_namespace.education]
  namespace  = vault_namespace.education.path
  path       = "training"
}

#-----------------------------------------------------------
# Create 'admin/education/training/boundary' namespace
#-----------------------------------------------------------
resource "vault_namespace" "boundary" {
  depends_on = [vault_namespace.training]
  namespace  = vault_namespace.training.path_fq
  path       = "boundary"
}

#--------------------------------------
# Create 'admin/test' namespace
#--------------------------------------
resource "vault_namespace" "test" {
  path = "test"
}
