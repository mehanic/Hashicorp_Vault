#!/usr/bin/env bash

VAULT_VERSION=${VAULT_VERSION:-1.7.1}
VAULT_PORT=8200

INSTALLED=$(vault --version | awk '{print $2}' || echo "")

if [ -z "$INSTALLED" ] || [ "$INSTALLED" != "v${VAULT_VERSION}" ]; then

    mkdir -p ${HOME}/bin/
    curl -o /tmp/vault_${VAULT_VERSION}_linux_amd64.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip
    unzip -d ${HOME}/bin/ -o /tmp/vault_${VAULT_VERSION}_linux_amd64.zip
    rm -f /tmp/vault_${VAULT_VERSION}_linux_amd64.zip

fi


DOCKER_STATE=$(docker inspect -f '{{.State.Running}}'  vault || echo 'false')
if [ $DOCKER_STATE != "true" ]; then
    docker rm -f vault

    docker pull -q vault:${VAULT_VERSION}

    docker run \
        -d \
        --name vault \
        -p 0.0.0.0:8200:8200 \
        --cap-add=IPC_LOCK \
        -e "VAULT_DEV_ROOT_TOKEN_ID=myroot" \
        -e "VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:${VAULT_PORT}" \
        vault:${VAULT_VERSION}

fi

echo "export VAULT_ADDR=\"http://127.0.0.1:${VAULT_PORT}\"" > ${HOME}/.extra.vault
echo "export VAULT_TOKEN=myroot" >> ${HOME}/.extra.vault

source ${HOME}/.extra.vault
