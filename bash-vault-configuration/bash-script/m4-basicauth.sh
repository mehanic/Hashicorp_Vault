
vault server -dev 


export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=AddYourVaultTokenHere



vault login

vault auth list

vault auth enable userpass

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request POST \
 --data '{"type": "userpass"}' $VAULT_ADDR/v1/sys/auth/userpass


#Explore the userpass auth method
vault path-help auth/userpass

#Add a user to the userpass auth method
vault write auth/userpass/users/arthur password=dent

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request POST \
 --data @ford.json $VAULT_ADDR/v1/auth/userpass/users/ford


vault list auth/userpass/users

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request LIST \
 $VAULT_ADDR/v1/auth/userpass/users


#Start a second session
vault login -method=userpass username=arthur

vault token lookup

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request POST \
 --data '{"username": "ford", "password": "prefect"}' $VAULT_ADDR/v1/auth/userpass/login/ford


#Reset password
vault write auth/userpass/users/arthur/password password=tricia

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request POST \
 --data '{"password": "zaphod"}' $VAULT_ADDR/v1/auth/userpass/users/ford/password


#Remove account
vault delete auth/userpass/users/arthur

#Linux
curl --header "X-Vault-Token: $VAULT_TOKEN" --request DELETE \
 $VAULT_ADDR/v1/auth/userpass/users/ford


