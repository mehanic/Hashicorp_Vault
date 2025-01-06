module "terraform-vault-kv-path" {
  source      = "../../modules/terraform-vault-kv-path"
  kv_path     = "dresden"
  secret_path = "dresden/demo"
  secret_data = "{\"login\": \"anonymous\", \"password\": \"guest\", \"ttl\": \"20s\"}"


}
