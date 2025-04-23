## Overview

In authentication, we will understand: Auth methods, Auth workflow, Entities and Groups. In General, authentication methods are used to perform authentication and manage identities that are responsible for assigning identity and policies to the user. In addition, multiple auth methods can be enabled at same time and once authenticated, Vault issues ***client token*** that is used for Vault requests.

* Auth methods can be human or system or machine-machine suhc as AWS, Azure, GCP, Kerberos, TLS, LDAP etc. 
* Before using auth methods, they need to be enabled
* For **New Vault Deployment**, the only method is ***ROOT TOKEN***
* Interface such as CLI, UI, API can be used but CLI is more efficient and better approach
* Enabling auth method `vault auth enable <path>`

### Token

* It is core authentication method for creating and storing tokens
* Most Vault operations need token, thus it **CAN'T BE DISABLED**
* Auth methos with LDAP/OIDC will also generate a token
* A token, when generated, is associated with policies and TTL (time to live)

### Authentication Workflow

Auth workflow can be illustrated in image below:
<p align="center">
    <img src="https://github.com/worklifesg/Terraform-Vault-Works/blob/master/images/Vault_auth_method.jpg" width="600" height="300">
</p>

* User authenticates Vault with credentials
* Authenticated credentials are validated against the provider
* After authentication, token is generated which is attached with policies and TTL
* The token is then returned to the user for further use