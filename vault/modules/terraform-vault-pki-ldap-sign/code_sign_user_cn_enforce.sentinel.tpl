import "strings"

# Function that enforce the CN for certificate signing requests
validate_cn = func() {

  # Print some information about the request
  # Note that these messages will only be printed when the policy is violated
  print("Namespace path:", namespace.path)
  print("Request path:", request.path)
  print("Request data:", request.data)

  if "common_name" in keys(request.data) {
    # Test for valid email address that matches the username that logged into Vault
    if request.data.common_name not matches "^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$" {
      print("Invalid common_name format. Please use a valid email address.")
      return false
    } else if strings.split(request.data.common_name, "@")[1] != strings.to_lower("${valid_domain}") {
      print("Invalid common_name. Please use an email address from the ${valid_domain} domain.")
      return false
    } else if strings.split(request.data.common_name, "@")[0] != token.metadata.username {
      print("Invalid common_name. Please use the same username you logged into Vault with for the email account name.")
      return false
    }
  } else {
    print("Common_name not present.")
    return false
  }

  return true
}

# Main Rule
cn_validated = validate_cn()
main = rule {
  cn_validated
}
