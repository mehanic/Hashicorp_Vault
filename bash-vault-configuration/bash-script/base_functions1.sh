if [ "${DEBUG}" == "true" ]; then
  DEBUGGER="--debug"
else
  DEBUGGER="--no-debug"
fi

create_workspace () {
  tfe workspaces create ${WORKSPACE} \
    --organization=${ORGANIZATION} \
    --oauth_token=${OAUTH_ID} \
    --branch=${BRANCH} \
    --repo=${REPO}  \
    ${DEBUGGER} \
    "$@"
}

create_variable () {
  KEY=$1
  VALUE=$2
  shift 2

  tfe variables create ${KEY} ${VALUE} \
    --organization=${ORGANIZATION} \
    --workspace=${WORKSPACE} \
    --category=${CATEGORY} \
    ${DEBUGGER} \
    "$@"
}

delete_workspace () {
  WORKSPACE=$1
  shift
  tfe workspaces delete ${WORKSPACE} \
    --organization=${ORGANIZATION} \
    ${DEBUGGER} \
    "$@"
}
