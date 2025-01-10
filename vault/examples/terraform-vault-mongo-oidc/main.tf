module "terraform-vault-mongo-oidc" {
  source             = "../../modules/terraform-vault-mongo-oidc"
  mongodb_public_key = <<EOT
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoASfYiuFvm6NypaG0xIK
6rYV3ejNhArsvn+GkvHBis8iEJ/QvJP/jy58GeJCtQL3FpYGWehbxcybsHcZznIn
RbfWZtZJhSuThq3JoHTdfWlzQ13ofRfvkAlanH49P4OCzE3oTTyU9h/eXbfz6Ar7
aqoAJJ05zS7ygtQALgnn8/a3qHNxRQ2lI9dkPKH/iJVBP0b9nlWEmDDnXMos6jPV
Btik97cQLpJIn2uZ5t85uXtdeffVtTNkk+cM8JuOHcu7pBM6pdsZ0pddwDQi2jsx
yapXYxdJTtJcgIdJ5jruxCDPsssMHTqd2kW7HDo3n9kUF2Dph8ZzvnNP7TOxXwTE
7QIDAQAB
-----END PUBLIC KEY-----
EOT

  mongodb_private_key = <<EOT
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCgBJ9iK4W+bo3K
lobTEgrqthXd6M2ECuy+f4aS8cGKzyIQn9C8k/+PLnwZ4kK1AvcWlgZZ6FvFzJuw
dxnOcidFt9Zm1kmFK5OGrcmgdN19aXNDXeh9F++QCVqcfj0/g4LMTehNPJT2H95d
t/PoCvtqqgAknTnNLvKC1AAuCefz9reoc3FFDaUj12Q8of+IlUE/Rv2eVYSYMOdc
yizqM9UG2KT3txAukkifa5nm3zm5e11599W1M2ST5wzwm44dy7ukEzql2xnSl13A
NCLaOzHJqldjF0lO0lyAh0nmOu7EIM+yywwdOp3aRbscOjef2RQXYOmHxnO+c0/t
M7FfBMTtAgMBAAECggEAH2uY8jlSiyiBHgD9m09lJl43n/m49Q8CGovG3G6tDrkK
WtJOteCnozFA/AIiEBHze5NczuWhs46wGW/heNiQXo+xAUNdb1E1qBHSz/dykFAW
6mjzoDCFgTZc/PKKy0Bi/APmM9hL9aIfUy6uLWeOo4ya95WJxoDL7KV9HY0jZxNA
tmpT+uQjrbW4q/YuZ9M/9oM0mKMcZU89o7/me6xG5rKRPpV7Lb/KgHytazxknlfF
yP0U10ECAxDkMo3akVFNDpfIYm3Nsz/eWAwRh0Ya07YO1v5Wt5j7MX1Fvx4Kfgco
XfKhSqyLaKrMcrWHoJgBS0CbS8+IG069+4ofeUcBoQKBgQDVj/VvuMn/YQjw7Q7I
/gIRfy9W5GDrvtwvmXRFX9R78II6QMD0rm8B691Tp0VFc4uhjXHwvJ0k0WKnu0he
GUOS4EmnynN5k3fzUzRGh3iohwOf+TiOjfCk9hWH+TrSjS6pj6OnyzwMG4i3gPv7
rxLJApRNK3MsDGxPc6q8rvKRsQKBgQC/0NW6iyNMmeMujh0CHygdH/IwiDUhjIoG
CMsF5YeIDnDBzjt4kWBLa6q5WquXu9PmhU7cwh8U26J6pQk9qUhnJy2/fnLQQjHl
HGSAI8dWpRjBUcuZAVzXnBm+arEpGCXQiIgKNNqH0GE5Fw0M9aA/xs8Byhx5mf+8
JRCembiZ/QKBgDqKrOAESrMLuXS5tvzXzF9ZevOZxQu6lQcjTKEbxNZ4tmobiAlK
q7leG5yr1KxWISeW623vdjA6iY2rJApPaJuhie9J6t+f0hjMbR8MUcH4yMCYg61o
MVg28O4GHt7KvsjSTC1Z48r53T9YRzrV4hNh9p800ux3N1WMQnhYiLvxAoGAJVHt
c5kEqi+6uuEdlb8YH+qKRZUKuVdNt3TYg3IwF3Gv0JVejsvCL4poMh4JCsGZrd08
BcmjIHzHNRONI7kfBCrkRMDGd+yZJpmKmD/d1ebTVTGj6kYQmUae36SEiZlQKi2W
Ql4cMpaBhAkPGflkT2RP/GoldidXUXToseL4vsUCgYEAkjXj3qDBdI00YxnVigsn
gXwkPWUaeDIvzrczQzqNCmVFoUvscHQCaSTKx6c0u3INacFGF0EGupjx3oyHPV2k
eI9xtebXDdliEpFIa4L0gMoPey4NQDVUiax88pVc0lvH2+LlQzW+9sJftuQnQ18b
HGDS9Ut8YjDMlf3qMl3SW7U=
-----END PRIVATE KEY-----
EOT

  mongodb_project_id = "mongodb_atlas_project_123456"

  mongodb_users_groupname = "admin_users"

  mongodb_users_metadata = {
    "key1" = "value1"
  }

  oidc_group_alias_name = "admin_group"

  oidc_mount_accessor = "auth_oidc_4e7acdd8"


}
