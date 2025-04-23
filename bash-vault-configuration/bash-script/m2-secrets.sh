
VAULT_VERSION="1.0.1"
wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip

#Install unzip if necessary
sudo apt install unzip -y
unzip vault_${VAULT_VERSION}_linux_amd64.zip
sudo chown root:root vault
sudo mv vault /usr/local/bin/


vault server -dev 


export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=AddYourVaultTokenHere


vault login

vault kv put secret/hg2g answer=42

curl --header "X-Vault-Token: $VAULT_TOKEN" --request POST \
 --data @marvin.json $VAULT_ADDR/v1/secret/data/marvin
vault kv get secret/hg2g

sudo apt install jq -y
curl --header "X-Vault-Token: $VAULT_TOKEN" $VAULT_ADDR/v1/secret/data/marvin | jq

vault kv put secret/hg2g answer=54 ford=prefect
vault kv get secret/hg2g

#Delete the secrets
vault kv delete secret/hg2g
vault kv get secret/hg2g

#For Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request DELETE $VAULT_ADDR/v1/secret/data/marvin

