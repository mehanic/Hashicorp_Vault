#Export the Vault server running in AD environment
export VAULT_ADDR=https://vault.globomantics.xyz:8200
export VAULT_TOKEN=AddYourVaultTokenHere



#Log into Vault server
vault login

#Create a new secrets engine kv path for devs
vault secrets enable -path=devkv kv
vault kv put devkv/alldevs answer=42

#Create a new policy for devs
vault policy write dev devpol.hcl

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request PUT \
 --data @devpol.json $VAULT_ADDR/v1/sys/policies/acl/dev-clone


#List vault policies
vault policy list

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" \
    $VAULT_ADDR/v1/sys/policy


#Put a secret that devs can't get
vault kv put secret/nodevs mchammer=canttouchthis

#Enable the LDAP auth method
vault auth enable ldap

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request POST \
 --data '{"type": "ldap"}' $VAULT_ADDR/v1/sys/auth/ldap


vault write auth/ldap/config \
    url="ldaps://adDC-0.globomantics.xyz:636" \
    userattr="sAMAccountName" \
    userdn="ou=Globo Users,dc=globomantics,dc=xyz" \
    groupdn="ou=Globo Groups,dc=globomantics,dc=xyz" \
    groupfilter="(&(objectClass=group)(member:1.2.840.113556.1.4.1941:={{.UserDN}}))" \
    binddn="cn=vault-ldap,cn=Users,dc=globomantics,dc=xyz" \
    bindpass='VerySecurePassword@123' \
    groupattr="memberOf" \
    certificate=@globomantics-adDC-0.pem \
    insecure_tls=false \
    starttls=true

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request POST \
 --data @ldap-config.json $VAULT_ADDR/v1/auth/ldap/config


vault write auth/ldap/groups/developers policies=dev

#Start a second session
vault login -method=ldap username=adent

#Put a new secret in devkv and read the existing one
vault kv put devkv/arthur ford=friend
vault kv get devkv/arthur
vault kv get devkv/alldevs

#Put a new secret in the devkv appId path
vault kv put devkv/appId-123 api-key=123 toast=good
vault kv put devkv/appId-123 api-key=123 environment=toast
vault kv put devkv/appId-123 api-key=123 environment=qa description="secret for appId 123"

vault kv put secret/arthur dolphins=solong
vault kv get secret/nodevs

vault token lookup
vault kv put secret/b91442f7-ccaa-da11-52d7-b646a2e268fc/friends best=ford
vault secrets list
