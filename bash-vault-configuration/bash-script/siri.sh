curl -v \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data '{ "data": { "attributes": { "is-destroy":false, "message": "run from siri" }, "type":"runs", "relationships": { "workspace": { "data": { "type": "workspaces", "id": "ws-WGpov4PBKLt323Ep" } } } } }' https://app.terraform.io/api/v2/run
