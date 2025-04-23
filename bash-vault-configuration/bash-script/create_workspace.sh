curl --insecure \
  --header "Authorization: Bearer $TOKEN \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data @workspace_create.json \
  https://app.terraform.io/api/v2/organizations/ORGNAME/workspaces
