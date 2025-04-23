#!/bin/bash

# Load any custom environment variables used in this script
. env.sh

# Load any common functions used across cloud scripts
. base_functions.sh

if [ -z "${TERRAFORM_ENTERPRISE_TOKEN}" ];then
  echo "TERRAFORM_ENTERPRISE_TOKEN is not set, tfe cli will not be able to authenticate"
  echo "Set this to a user token with permissions to create workspaces"
  exit 1
fi

# Read in google credentials JSON file.
if [ ! -f ${GCP_CREDENTIALS_FILE} ];then
  echo "You need to have a Google Credentials JSON file with Google Compute Admin privileges"
  echo "Set GCP_CREDENTIALS_FILE=<file location>"
  exit 1
fi

GOOGLE_CREDENTIALS=$(cat ${GCP_CREDENTIALS_FILE})
GCP_CREDS_PAYLOAD=/tmp/tfe_gcp_creds_payload.json
create_gcp_creds () {
  # In order to upload JSON, need to use the API, so need to also generate the JSON with JSON inside.   How deep down the rabbit hole will we go?
  cat > ${GCP_CREDS_PAYLOAD} <<EOF
{
  "data": {
    "type":"vars",
    "attributes": {
      "key":"GOOGLE_CREDENTIALS",
      "value":"'$(cat ${GCP_CREDENTIALS_FILE})'",
      "category":"env",
      "hcl":true,
      "sensitive":true
    },
    "relationships": {
      "workspace": {
        "data": {
          "id":"${WORKSPACE_ID}",
          "type":"workspaces"
        }
      }
    }
  }
}

EOF

curl \
  --header "Authorization: Bearer ${TERRAFORM_ENTERPRISE_TOKEN}" \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data @${GCP_CREDS_PAYLOAD} \
  https://app.terraform.io/api/v2/vars
}

# This function should be in all different cloud vendor scripts
# as what we create in each cloud may be slightly different
create_variables () {
  # GCP specific variables to create
  # DO NOT PUT YOUR SECRETS (gcp_credentials) HERE!!!   Do this via the GUI
  CATEGORY=terraform
  create_variable gcp_project ${PROJECT}
  create_variable gcp_region ${REGION}
  create_variable gcp_zone ${ZONE}
  create_variable machine_type ${MACHINE_TYPE}
  create_variable instance_name ${OWNER}-${WORKSPACE}
  create_variable owner ${OWNER}
  create_variable ttl ${TTL}
  # Environment variables
  # DO NOT PUT YOUR SECRETS HERE!!!   Do this via the GUI
  CATEGORY=env
  # create_gcp_creds
  create_variable CONFIRM_DESTROY 1
}

###  Create GCP Workspaces ###
# Core variables for GCP space
# These re-use common names for functions.
WORKSPACE_PREFIX=${GCP_WORKSPACE_PREFIX}
MACHINE_TYPE=${GCP_MACHINE_TYPE}
PROJECT=${GCP_PROJECT}
REPO=${GCP_REPO}
REGION=${GCP_REGION}
ZONE=${GCP_ZONE}

for ENVIRONMENT in ${GCP_ENVIRONMENTS};do
  BRANCH=${ENVIRONMENT}
  WORKSPACE=${WORKSPACE_PREFIX}-${BRANCH}
  # Create the workspace with the variables above
  create_workspace
  # Grab the workspace id to use the API for sending Google JSON payload
  export WORKSPACE_ID=$(tfe workspaces get ${WORKSPACE} --organization=${ORGANIZATION} --only=id --value)
  create_variables
done
