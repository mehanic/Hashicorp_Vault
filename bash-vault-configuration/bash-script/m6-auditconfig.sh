
export VAULT_ADDR=https://vault-1.globomantics.xyz:8200
export VAULT_TOKEN=AddYourVaultTokenHere




#Create the directory that vault will write to
sudo mkdir /var/log/vault
sudo chown vault:vault /var/log/vault

vault audit enable file file_path=/var/log/vault/vault_audit.log log_raw=true

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request PUT \
    --data @auditconfig.json $VAULT_ADDR/v1/sys/audit/file1


#Add another path
vault audit enable -path=file2 file file_path=/var/log/vault/vault_audit2.log


#On vault server enable the syslog audit device to a facility
vault audit enable syslog tag="vault" facility="LOCAL7"

#Run the following query on Logs
Syslog
| where Facility == "local7" 

#Add some entries to the audit log
vault secrets list
vault kv put secret/audittest secret=mysecret
vault kv get secret/audittest

#View file contents
sudo cat /var/log/vault/vault_audit.log | jq

sudo tail -1 /var/log/vault/vault_audit2.log | jq

sudo tail -1 /var/log/vault/vault_audit2.log | jq -r .response.data.secret

curl --header "X-Vault-Token: $VAULT_TOKEN" --request POST \
 --data '{"input": "mysecret"}' $VAULT_ADDR/v1/sys/audit-hash/file2 | jq -r .data.hash

#Disable original path
vault audit disable file

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request DELETE \
    $VAULT_ADDR/v1/sys/audit/file1



