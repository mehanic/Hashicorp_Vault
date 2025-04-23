# Vault Setup
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Windows/Linux setup

### Windows

1. Install latest version of Vault ![Vault Releases](https://releases.hashicorp.com/vault) i.e. in our case it is 1.12.1
2. Unzip the installed file
3. Edit your system variables and add the unzipped folder location to your PATH
4. Check ```vault-version``` on your CMD or VSCode Terminal

### Linux

```
$ curl --silent -Lo /tmp/vault.zip https://releases.hashicorp.com/vault/1.12.2/vault_1.12.2_linux_amd64.zip
$ cd /tmp/
$ unzip vault.zip
$ export PATH=$PATH:/tmp/vault
```

## Running Vault Dev Server

**NEVER USE DEV MODE IN PRODUCTION**

* Benefits: No config is needed, Automatic intialization & Unsealed, Enables UI (localhost), Provides Unsealed key, Auto logs as root
* Not so good features: Runs on memory (Non-persistent), Insecure (No TLS), Listener to 127.0.0.1:8200, Mounts K/V V2 SE, provides root token
* Use cases: POC, Testing new features, New dev integrations, Experiment with features
* Use 2 terminals (one to start/stop the session and other to run vault commands)

(Terminal 1)
```
$ vault server -dev
```

(Terminal 2)
```
set VAULT_ADDR=http://127.0.0.1:8200
vault status %to see the vault status
vault secrets lists %to list the available secrets
vault kv put secret/vaultcourse/shraman shraman=sam %Example for creating K/V v2 secret
vault kv get secret/vaultcourse/shraman %Read the secret key
vault login %login with root token
```

## Running Vault Server in Prod

* One or more persistent nodes via config file
* Storage backend (internal or external)
* Multiple modes in form of cluster (Single node has no redundancy and no scalability)
* Deploy close to applications
* Automatic provisioning of Vault
* Additional steps are: Add config file (/etc/vault/config.json), Create systemd file (Linux and resides in /etc/systemd/system), Config Storage Backend (Consul in our case)

```
/etc/systemd/system/vault.service %systemd service file
/etc/vault.d/vault.hcl %vault config file
/opt/vault/data %storing data
sudo systemctl start vault
sudo systemctl stop vault
vault status
systemctl status vault
sudo journalctl -u vault
```

When you edit or make changes in `vault.service`:

```
sudo vi /etc/systemd/system/vault.service
sudo systemctl daemon-reload
sudo systemctl start vault
```