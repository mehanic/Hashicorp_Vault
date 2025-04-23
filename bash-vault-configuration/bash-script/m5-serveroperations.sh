
export VAULT_ADDR=https://vault-1.globomantics.xyz:8200
export VAULT_TOKEN=AddYourVaultTokenHere


#Initialize the new vault server
vault operator init -status
vault operator init

#Check status
vault status

#Unseal vault server
vault operator unseal

#Linux
curl --request PUT \
 --data '{"key": "SHARE_KEY"}' $VAULT_ADDR/v1/sys/unseal | jq


#login into vault server
vault login

#Rotate the encryption key
vault operator key-status
vault operator rotate

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request PUT \
 $VAULT_ADDR/v1/sys/rotate


#Rekey the vault seal
vault operator rekey -init -key-shares=3 -key-threshold=2

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request PUT \
 --data '{"secret_shares": 5, "secret_threshold": 2}' $VAULT_ADDR/v1/sys/rekey/init | jq


vault operator rekey -status
vault operator rekey

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request PUT \
 --data '{"key": "SHARE_KEY", "nonce": "NONCE"}' $VAULT_ADDR/v1/sys/rekey/update | jq


#Rotate the root key
vault operator generate-root -generate-otp

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request PUT \
 $VAULT_ADDR/v1/sys/generate-root/attempt | jq


vault operator generate-root -init -otp="OTP_TOKEN"
vault operator generate-root

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request PUT \
 --data '{"key": "SHARE_KEY", "nonce": "NONCE"}' $VAULT_ADDR/v1/sys/generate-root/update | jq


vault operator generate-root -decode="DECODE_TOKEN" -otp="OTP_TOKEN"

#No equivalent operation in API, need to decode base64 string and XOR with OTP

#Login with new root token
vault login

#Revoke the old root token
vault token revoke ROOT_TOKEN

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request POST \
 --data '{"token": "OLD_TOKEN"}' $VAULT_ADDR/v1/auth/token/revoke


#Seal the vault for maintenance
vault operator seal

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request PUT \
 $VAULT_ADDR/v1/sys/seal


vault status

