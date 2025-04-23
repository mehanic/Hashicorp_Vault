# Generate an RSA private key
resource "tls_private_key" "main" {
  algorithm = "RSA"
  rsa_bits  = 2048  # Optional: define the key size, default is 2048
}

# Write the private key to a local file and set permissions using local-exec
resource "local_file" "private_key" {
  content  = tls_private_key.main.private_key_pem
  filename = "${path.module}/${var.env}.pem"
  file_permission = "0600"  # Ensures only owner can read and write the private key
}

# Create an AWS Key Pair using the public key from the generated private key
resource "aws_key_pair" "aws" {
  key_name   = var.env
  public_key = tls_private_key.main.public_key_openssh
}

# Output the private key file path
output "private_key_path" {
  value = local_file.private_key.filename
  description = "The path to the private key file."
}
