module "terraform-vault-pki-kubernetes-auth" {
  source   = "../../modules/terraform-vault-pki-kubernetes-auth"
  k8s_host = "https://k8s.example.com:6443"

  k8s_ca_cert = <<EOF
-----BEGIN CERTIFICATE-----
MIIDCTCCAfGgAwIBAgIUA6W/Am5yDbWIePnhyssw7T4JwwkwDQYJKoZIhvcNAQEL
BQAwFDESMBAGA1UEAwwJbXktazhzLWNhMB4XDTI1MDExMzAyMDUwNFoXDTM1MDEx
MTAyMDUwNFowFDESMBAGA1UEAwwJbXktazhzLWNhMIIBIjANBgkqhkiG9w0BAQEF
AAOCAQ8AMIIBCgKCAQEAxxiREJJQMgjaejDt6VQJKCaEsNk0dQU88k8ZCHqi5msv
Uiwyq0OV781NW9bsZobfpKc9PfXsXq8jXEhY4c/Xh1T0X1OpfVmr20fpA5cIDkSt
9pr9+jn0F2NehgAJX5jxpry32YiIOidajRMNI9v8HHTvR9ZNjQzeoNInQx6uIwdv
N8fEfXNTuIewV0egRbU+nViLBed0Nt7PTJpm2r80RUEopx7q06a6AzbC8kHJCQ4g
Bk6kleI5E68V/J5gGKwtpyqKo9wOzmkTgu5oEfd96R22ewlc+YcGo7YCdu0l2BIg
iJYJeCgdfYwxIuNqmDBo49Ym+Ipf1HIsZmgX1/1tYQIDAQABo1MwUTAdBgNVHQ4E
FgQUV2rgpXRxqOFwPZeMR0t9925nsOowHwYDVR0jBBgwFoAUV2rgpXRxqOFwPZeM
R0t9925nsOowDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAO6Mt
LS/6EtsYILM71aiTqov3QZyWimmpywh/6ssjl5wyvHYprOjO/+dBTmZK00CSfpyn
nKq5+H7j4CIzJugLgdU6NFe1M1a4hPJVgl3O+BfE14mZZ99GghHLuhOorcAel9W5
AXmJMQrunXBPTJhSUio3RlVQ6RY6ihsz3hF95BgEd4ItF46oBuc6c0i9e250AFKU
HoSQaMbuBxYAEIwIE3XHv4zbDjvnPdI5sv4OfRdUC7WwxsG6D3LbiXIl/rL5skKj
/YHP3KroazO8LMY9Jws9V9eZc0Y6qJN7gg4+Qv2Nekc6EaXkAgzaHkw4yD8OrapZ
6yH8TuGuUe7AVWm+BA==
-----END CERTIFICATE-----
EOF

  token_review_jwt = "eyJhbGciOiJSUzI1NiIsImtpZCI6IjA5Y2ZjZWI2LTNlNzAtNDgxYS05M2FkLWJhMGZkNjYzZjFjMyJ9.eyJhdWQiOiI0MTJmYzdkMy1mNDEyLTRkZmUtODY5Yi1iOGQwMDZkZDVmMzMiLCJzdWIiOiI2Y2FjNzVhZi0zMTZlLTRlYjgtZDMzMy0yMjY2MGYzM2E0ZTciLCJhdXRoX3RpbWUiOiIyMDIxLTAxLTAyVDE1OjYzOjA4LjQ3OTh5In0.-45c1C1JY4Ed8YTdyT2Ym75p9TRO8-eRPymcKtnmnF_8D0Xp4d2pYsYwsbXpx_M3OYhX4gOJlI1f6W44tw6_zqK9gXY_cKb8zkn8WjVoYzfp0_m-fK0r8RV9wts1h...ZTYiQ=="

}
