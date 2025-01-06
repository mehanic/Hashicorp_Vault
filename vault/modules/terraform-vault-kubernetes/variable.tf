variable "kubernetes_host" {
  description = "Kubernetes API endpoint"
  default     = "https://192.168.1.100:6443" # Example default value for a local Kubernetes API server , default     = "https://your-kubernetes-api-endpoint
}

variable "kubernetes_namespace" {
  description = "Kubernetes Namespace"
  default     = "default"
}

variable "kubernetes_sa" {
  description = "Kubernetes Service Account"
  default     = "default"
}

variable "kubernetes_ca_cert" {
  description = "Kubernetes CA"
  default     = <<EOT
-----BEGIN CERTIFICATE-----
MIIDfzCCAmegAwIBAgIUYf6rPpOa/+yqSw0fN2vZl5l8QykwDQYJKoZIhvcNAQEL
BQAwTzELMAkGA1UEBhMCVVMxCzAJBgNVBAgMAldBMQ0wCwYDVQQKDARUZXN0MRUw
EwYDVQQDDAxrdWJlcm5ldGVzLWNhMB4XDTIxMDYwMTA5MDAwMFoXDTMxMDUzMTA5
MDAwMFowTzELMAkGA1UEBhMCVVMxCzAJBgNVBAgMAldBMQ0wCwYDVQQKDARUZXN0
MRUwEwYDVQQDDAxrdWJlcm5ldGVzLWNhMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
MIIBCgKCAQEAtVyzBd+7Gz2QGElPe3JgX1lIf6urKMK8zzTh3q9yIqyzlwTY1Iae
Nyh5C1oR3AbXkmFxtG5fFpo5U+51X3YzEFHa5AQK6HJeTfnm5WJIzkhG5EQaUerJ
kzDwW9bFX+2uKMN6hxoHqsLAnGc5ilZjIzdsdBrzzyHfPBRp5ZpYeKf/ENvHgwML
U9gQXpTof5LTsX52CBjx9WNRFGVZGUB5kEN19YXyxsmFHoHYXtkQ+as1KLsMhE3Y
ZnK/w3F1ErK4VnKZ1KhUq/wUX87ZWgUsV/q6vHRFjy5Vj6LeBOSMoK/h0TxDLqoe
MlZKiOEevS/hCU8BxR00PCrK2ZmJ/uCthwIDAQABo1MwUTAdBgNVHQ4EFgQUKPtZ
73cPlc8z74/fucRdAHGiQ0IwHwYDVR0jBBgwFoAUKPtZ73cPlc8z74/fucRdAHGi
Q0IwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAITnYdEBCtHwx
NhJYr3E0XZUG6Kwhm7n/1nNxgd0W3m8K5XJSK9E/k7k6pPfuZEMBunQtBWrF6VjT
OAcDbyIBhg+6ZEtzfbql8F6eO5p1BxNIt9t1xi1sh55Eq0LlGvqVGc1TbGCRn8tw
eMe+0g++qNMSKYO3N7E82RSPGkAOew3DseLP7RTkXg20bBjY9xOrG03uOS8we/KV
VOjGnsc9+edZoG7z9QsWhjIg8b5i6aPQIAWtNTyJ+oA0MF5TZgUsSe39F9LqPjNm
ZZxxvUPY+PG/sX8oP/83tXMh1rf7QUQKnw5seJY3JXXTqE7mklX4HZFGFpKFP4K1
iwxQsF3cuw==
-----END CERTIFICATE-----
EOT
}

variable "token_reviewer_jwt" {
  description = "Kubernetes Auth"
  default     = "eyJhbGciOiJSUzI1NiIsImtpZCI6IkFhY3lqR3dsYmVvU0xZTjVfN2pkZDZ2OWpnRHFic2ZHVzAiQD__f3fAG8hLrdGsCboIS9Shjz7_zLqzAM9fY-4PaJr5Vgh5Gp4q4mjNOp0zST7okbSO7kYtwzeyuLBFzQMQcqXlydsnbGfQp0l_eQXkyN2gXb84t8HZ6dgtERhBBPtjr4dKhMhtGbJtxnV06CzNdeR0J4-znhtkpVm5aFkftOyfBfJYFOj8k8mnYFEthFpkONgfo1vv4w5I_DqYvq9VJxYZ94gR7vnbVuboi9jQWkGV7dbpGAxMvnL5Kk6L9ctdHZzSTvVwY0x8aByPRcHHfJQLY90kIq9WrYPHqTLe2UJrkKzrzA5mCGN6zJ6EslKvLS2Xqopw1z18izD6fzckXhQhO8qZzo9_vuwA"
}

variable "k8s_role" {
  description = "Kubernetes Vault Auth role name"
  default     = "k8s"
}

variable "k8s_path" {
  description = "k8s auth backend mount point"
  default     = "k8s"
}

variable "policy_name" {
  description = "Name of the policy to be linked to"
  default     = "k8s-policy"
}
