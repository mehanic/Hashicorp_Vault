
resource "aws_iam_user" "vault" {
  name = "vault"
  path = "/system/"
}

resource "aws_iam_access_key" "vault" {
  user = aws_iam_user.vault.name
}

resource "vault_aws_secret_backend" "aws_vault_account" {
  path       = var.aws_secret_backend_path
  access_key = aws_iam_access_key.vault.id
  secret_key = aws_iam_access_key.vault.secret
  region     = "us-east-1"
}

resource "vault_aws_secret_backend_role" "dyndns" {
  backend         = var.aws_secret_backend_path
  name            = var.dynamic_name
  credential_type = var.credential_type
  policy_document = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "route53:ChangeResourceRecordSets",
      "Resource": "arn:aws:route53:::hostedzone/${var.route53_hosted_zone}"
    }
  ]
}
EOT
}

resource "vault_policy" "dyndns" {
  name = vault_aws_secret_backend_role.dyndns.name

  policy = <<EOT
path "${var.aws_secret_backend_path}/creds/${vault_aws_secret_backend_role.dyndns.name}" {
  capabilities = ["read"]
}
EOT
}

# Error: error creating role "dyndns" for backend "aws_route53": Error making API request.
# │ 
# │ URL: PUT http://127.0.0.1:8200/v1/aws_route53/roles/dyndns
# │ Code: 404. Errors:
# │ 
# │ * no handler for route "aws_route53/roles/dyndns". route entry not found.
# │ 
#  two times execute terraform apply --auto-approve


# Основные различия:
# Назначение:

# vault_aws_secret_backend: Используется для активации AWS секретного движка и указания учетных данных для доступа к AWS.
# vault_aws_secret_backend_role: Используется для создания роли, которая определяет какие секреты (например, IAM ключи) можно запросить через этот движок для конкретных операций (например, с Route 53).
# Ресурс:

# vault_aws_secret_backend настраивает сам движок, который будет генерировать и хранить AWS креденшлы.
# vault_aws_secret_backend_role создает роль, с помощью которой можно запрашивать креденшлы для выполнения специфичных действий в AWS, например, изменение записей в Route 53.
# Конфигурация:

# vault_aws_secret_backend: Требует учетных данных для доступа к AWS.
# vault_aws_secret_backend_role: Требует политики, которая описывает, какие действия могут выполняться с генерируемыми секретами.
# Взаимодействие:
# Чтобы использовать роль vault_aws_secret_backend_role для получения секретов AWS, сначала необходимо создать и настроить движок vault_aws_secret_backend, а затем создать роль с нужными политиками доступа для конкретных сервисов (например, Route 53).