curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data @confirm_apply.json \
  https://app.terraform.io/api/v2/runs/run-7hMTPXUqTosMzRcN/actions/apply
