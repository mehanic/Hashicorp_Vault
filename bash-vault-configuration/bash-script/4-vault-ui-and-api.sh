
echo $root_token

# Now open a browser on http://127.0.0.1:8200/ui

# Fun! Now let's use curl to interact with the API using
# the root token.

curl --header "X-Vault-Token: $root_token" --request GET \
 $VAULT_ADDR/v1/sys/host-info