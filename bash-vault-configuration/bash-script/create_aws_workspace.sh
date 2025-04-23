#!/bin/bash

# Load any custom environment variables used in this script
. env.sh

# Load any common functions used across cloud scripts
. base_functions.sh


# Read in AWS credentials environment variables
if [ ! -f ${AWS_CREDENTIALS_FILE} ];then
  echo "You need to have a AWS Credentials file with AWS IAM credentials with permissions to launch all AWS Resources"
  echo "Set AWS_CREDENTIALS_FILE=<file location>"
  exit 1
fi

. ${AWS_CREDENTIALS_FILE}

# This function should be in all different cloud vendor scripts
# as what we create in each cloud may be slightly different
create_variables () {
  # AWS specific variables to create
  CATEGORY=terraform
  create_variable name ${OWNER}-${WORKSPACE}
  create_variable aws_region ${REGION}
  create_variable instance_type ${INSTANCE_TYPE}
  create_variable owner ${OWNER}
  create_variable ttl ${TTL}
  # Environment variables
  CATEGORY=env
  create_variable AWS_ACCESS_KEY_ID ${AWS_ACCESS_KEY_ID} 
  create_variable AWS_SECRET_ACCESS_KEY ${AWS_SECRET_ACCESS_KEY} --sensitive
  create_variable CONFIRM_DESTROY 1
}

###  Create AWS Workspaces ###
# Core variables for AWS space
# These re-use common names for functions.
WORKSPACE_PREFIX=${AWS_WORKSPACE_PREFIX}
INSTANCE_TYPE=${AWS_INSTANCE_TYPE}
REPO=${AWS_REPO}
REGION=${AWS_REGION}

for ENVIRONMENT in ${AWS_ENVIRONMENTS};do
  BRANCH=${ENVIRONMENT}
  WORKSPACE=${WORKSPACE_PREFIX}-${BRANCH}
  # Create the workspace with the variables above
  create_workspace
  create_variables
done
