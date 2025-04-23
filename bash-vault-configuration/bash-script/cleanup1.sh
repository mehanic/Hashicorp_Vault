# Load any custom environment variables used in this script
. env.sh

# Load any common functions used across cloud scripts
. base_functions.sh

delete_workspace app42-dev
delete_workspace app42-qa
delete_workspace app42-prod
delete_workspace gcp-compute-instance-dev
delete_workspace gcp-compute-instance-qa
delete_workspace gcp-compute-instance-prod
delete_workspace aws-ec2-instance-dev
delete_workspace aws-ec2-instance-qa
delete_workspace aws-ec2-instance-prod
