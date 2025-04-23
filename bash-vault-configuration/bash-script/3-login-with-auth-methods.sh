# Let's try logging in with our username and password first

vault login -method=userpass username=ned


vault login 

 # Alright now what do we need to log in with AppRole?

vault path-help auth/GloboAppRole/login

 # Okay, so we need the role_id and secret_id
 # Let's get the role_id first

vault read auth/GloboAppRole/role/webapp/role-id

roleId=ROLEID

# Now let's get the secret_id, since we're generating data we
# need to use the write command instead

vault write -force auth/GloboAppRole/role/webapp/secret-id

secretId=SECRETID

# And now we can log in! This also uses the write command
vault write auth/GloboAppRole/login role_id=$roleId secret_id=$secretId

# Sweet, now we could use that token in future requests

# Lastly, let's try logging in using the API with AppRole instead
curl --request POST \
  --data "{\"role_id\": \"$roleId\",\"secret_id\": \"$secretId\"}" \
  $VAULT_ADDR/v1/auth/GloboAppRole/login | jq