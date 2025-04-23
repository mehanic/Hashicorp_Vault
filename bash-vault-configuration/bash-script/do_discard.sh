curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data @discard.json \
  https://app.terraform.io/api/v2/runs/run-JHNj4M8w2yvQ6xj6/actions/discard
