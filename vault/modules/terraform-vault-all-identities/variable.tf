variable "key" {
  description = "Name of the OIDC Key"
  default     = "key"
}

variable "kubernetes_namespace" {
  description = "The namespace in Kubernetes where resources are applied"
  default     = "default"
}

variable "kubernetes_host" {
  description = "The Kubernetes API host URL"
  default     = "https://k8s-api.local"
}

variable "kubernetes_ca_cert" {
  description = "The Kubernetes CA certificate for authentication"
  type        = string
  default     = <<EOF
-----BEGIN CERTIFICATE-----
MIIDazCCAlOgAwIBAgIUER4VOuL/cvP+4mOHt3MMitrFAeQwDQYJKoZIhvcNAQEL
BQAwRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoM
GEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDAeFw0yNTAxMTQwMTM2MzNaFw0yNjAx
MTQwMTM2MzNaMEUxCzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEw
HwYDVQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQCnxhxHa5IqLIdccns9MMgxKIQz1ybRkYysFghhNBxV
dhUIxlQrJRDZFpQQ3agnvrAj+m86YUHL/KD8VyPSO/YbINwyZMAfo0ARhd8G7bfI
z0mmLml1r3tEB87VWaTHVSX3rsy8WW5jj9D+HKNEaLcPRo5eGs4PRqzk64eC+anJ
Gix9jSaE49m3DGo1rYHtLMujXs0wf2WLUaKSrtpOxGLu/uQMn0AICyS+PT2ZKONC
yaPHEO0YRsNYhA1av2K47ywsJjkEHwAYLkC8/q/Ieu1y0z+dC+H3SvKRFHebgJHj
pptOMe2lmY8G3PwrF7wOFwQSqsEI1wYq21guJjFmJ6hVAgMBAAGjUzBRMB0GA1Ud
DgQWBBR1sTi504x4Yl+dZJk7Uq7ZmYe23TAfBgNVHSMEGDAWgBR1sTi504x4Yl+d
ZJk7Uq7ZmYe23TAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQAQ
Lb7meCQnj5VTuoe/IfjB0qAgEuUz9OyjzU4jOj3eQARHg+8eu93WLL1g4F26hMdZ
eV8lP7HVIWOf0xPIUeqb/Z9K89nC4sLk/n//feBTi325jaahWHN4uGoaTIWZ6ZIA
NRrFz7fmGwuAK+fAitM8y0O4WbmGit4TZyBT04A7zoYHDVLDRjdA/AiXFg9SfgtR
KU8bqgx34W3zGoj9gS9l2oVvHd01bbgz3cvYN0BWlOq3rVh4VKGzoV/DG8+Zlrqy
M0/BsKD57xbxrfTaHfKE+9ADWflEcqoH7VryzfKjZ/hwVQhYjLglpmKmTpldsOwh
4xYe8CkP1TfrJQMMnS6u
-----END CERTIFICATE-----
EOF
}


variable "token_reviewer_jwt" {
  description = "JWT token for reviewing Kubernetes tokens"
  type        = string
  sensitive   = true
  default     = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhbGljZTQ2Mzc2MzgzMjIuZXhhbXBsZS5jb20iLCJpYXQiOjE2MzE3MTIzNTUsIm5hbWUiOiJ0b2tlbi1yZXZpZXctY2VydC1mb3Ita3ViZXJuZXQtYXV0aGVudGljYXRpb24ifQ.ZhJmGjFe9Mc_Zhq6GqeXfquSHgQwX1yD2IkMjGoR9N0"
}

variable "issuer" {
  description = "Issuer URL for OIDC provider"
  default     = "https://www.acme.com"
}

variable "disable_iss_validation" {
  description = "Whether to disable issuer validation"
  type        = bool
  default     = false
}
