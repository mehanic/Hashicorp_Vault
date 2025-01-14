# Cert Auth Backend
# resource "vault_auth_backend" "cert" {
#   //path = "cert"
#   path = var.cert_auth_mount_path
#   type = "cert"
# }


# openssl genrsa -out root-key.pem 4096
# openssl req -x509 -new -nodes -key root-key.pem -sha256 -days 3650 -out root-ca.pem -subj "/C=US/ST=California/L=San Francisco/O=Corp/OU=Platform/CN=RootCA"
# openssl genrsa -out cert-key.pem 2048
# openssl req -new -key cert-key.pem -out cert.csr -subj "/C=US/ST=California/L=San Francisco/O=Corp/OU=Platform/CN=foo.example.org"
# openssl x509 -req -in cert.csr -CA root-ca.pem -CAkey root-key.pem -CAcreateserial -out cert.pem -days 365 -sha256
# mv root-ca.pem /path/to/certs/ca-cert.pem



# ╰─λ openssl genrsa -out root-key.pem 4096                                 

# ╰─λ ls                                                                    
# root-key.pem

# ╰─λ openssl req -x509 -new -nodes -key root-key.pem -sha256 -days 3650 -out root-ca.pem -subj "/C=US/ST=California/L=San Francisco/O=Corp/OU=Platform/CN=RootCA"

# ╰─λ ls                                                                     
# root-ca.pem  root-key.pem
# ╰─λ openssl genrsa -out cert-key.pem 2048                                  

# ╰─λ ls                                                                     
# cert-key.pem  root-ca.pem  root-key.pem
# ╰─λ openssl req -new -key cert-key.pem -out cert.csr -subj "/C=US/ST=California/L=San Francisco/O=Corp/OU=Platform/CN=foo.example.org"

# ╰─λ ls                                                                     
# cert.csr  cert-key.pem  root-ca.pem  root-key.pem

# ╰─λ openssl x509 -req -in cert.csr -CA root-ca.pem -CAkey root-key.pem -CAcreateserial -out cert.pem -days 365 -sha256

# Certificate request self-signature ok
# subject=C = US, ST = California, L = San Francisco, O = Corp, OU = Platform, CN = foo.example.org
# ╰─λ ls                                                                    
# cert.csr  cert-key.pem  cert.pem  root-ca.pem  root-ca.srl  root-key.pem
