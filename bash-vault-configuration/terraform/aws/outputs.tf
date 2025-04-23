output "endpoints" {
  value = <<EOF

  vault-server (${aws_instance.vault-server.public_ip})
    - Initialized and unsealed.
    - The root token is stored in /home/ubuntu/root_key
    - The unseal key is stored in /home/ubuntu/unseal_keys

    $ ssh -l ubuntu ${aws_instance.vault-server.public_ip} -i ${var.key_name}.pem

EOF
}
