curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data @aws_sentinel_run_destroy.json \
  https://app.terraform.io/api/v2/runs
