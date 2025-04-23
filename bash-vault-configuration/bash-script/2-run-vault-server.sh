vault -help
vault server -help
vault server -dev
root_token=ROOT_TOKEN_VALUE
vault login -address="http://127.0.0.1:8200" $root_token