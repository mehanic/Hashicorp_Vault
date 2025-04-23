provider "google" {
  credentials = file(var.account_file_path)
  project     = var.gcloud_project
  region      = var.gcloud_region
}

resource "google_service_account" "vault_kms_service_account" {
  account_id   = "vault-gcpkms"
  display_name = "Vault KMS for auto-unseal"
}

resource "google_compute_instance" "vault" {
  name         = "vault-test"
  machine_type = "n1-standard-1"
  zone         = var.gcloud_zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {}
  }

  allow_stopping_for_update = true

  service_account {
    email  = google_service_account.vault_kms_service_account.email
    scopes = [
      "cloud-platform",
      "compute-rw",
      "userinfo-email",
      "storage-ro",
    ]
  }

  metadata_startup_script = <<-SCRIPT
    #!/bin/bash
    apt-get update && apt-get install -y unzip libtool libltdl-dev curl

    curl -s -L -o /tmp/vault.zip "${var.vault_url}"
    unzip /tmp/vault.zip -d /usr/local/bin
    chmod +x /usr/local/bin/vault

    mkdir -p /test/vault /opt/vault

    cat <<EOF > /test/vault/config.hcl
    storage "file" {
      path = "/opt/vault"
    }

    listener "tcp" {
      address     = "127.0.0.1:8200"
      tls_disable = 1
    }

    seal "gcpckms" {
      project     = "${var.gcloud_project}"
      region      = "${var.keyring_location}"
      key_ring    = "${var.key_ring}"
      crypto_key  = "${var.crypto_key}"
    }

    disable_mlock = true
    EOF

    cat <<EOF > /etc/systemd/system/vault.service
    [Unit]
    Description=HashiCorp Vault - A tool for managing secrets
    Documentation=https://www.vaultproject.io/docs/
    Requires=network-online.target
    After=network-online.target

    [Service]
    ExecStart=/usr/local/bin/vault server -config=/test/vault/config.hcl
    ExecReload=/bin/kill -HUP $MAINPID
    KillMode=process
    KillSignal=SIGINT
    Restart=on-failure
    RestartSec=5

    [Install]
    WantedBy=multi-user.target
    EOF

    echo 'export VAULT_ADDR="http://127.0.0.1:8200"' >> /etc/profile.d/vault.sh

    systemctl daemon-reexec
    systemctl daemon-reload
    systemctl enable vault
    systemctl start vault
  SCRIPT
}

output "project" {
  description = "The GCP project used for Vault"
  value       = google_compute_instance.vault.project
}

output "vault_server_instance_id" {
  description = "The Vault compute instance self-link"
  value       = google_compute_instance.vault.self_link
}

# KMS IAM Binding
resource "google_kms_key_ring_iam_binding" "vault_iam_kms_binding" {
  key_ring_id = "${var.gcloud_project}/${var.keyring_location}/${var.key_ring}"
  role        = "roles/owner"

  members = [
    "serviceAccount:${google_service_account.vault_kms_service_account.email}",
  ]
}
