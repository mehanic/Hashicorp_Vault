resource "vault_policy" "admin" {
  name   = "admin"
  policy = file("${path.module}/policy/admin-policy.hcl")
}

resource "vault_policy" "devops" {
  name   = "devops"
  policy = file("${path.module}/policy/devops-policy.hcl")
}

resource "vault_policy" "cicd-ro" {
  name   = "cicd-ro"
  policy = file("${path.module}/policy/approle-cicd-ro-policy.hcl")
}

resource "vault_policy" "cicd-rw" {
  name   = "cicd-rw"
  policy = file("${path.module}/policy/approle-cicd-rw-policy.hcl")
}
