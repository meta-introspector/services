bash /opt/services/scripts/get_secrets_solana.sh

cp /var/run/solana/secrets/env  "/var/run/solana/secrets/env.${CHAIN_NAME}"
# load the secret in
export $(cat /var/run/solana/secrets/env| xargs)

# now load the new secrets in
source /etc/solana/env

if [ -z "$CHAIN_ALIAS" ]; then
    echo "alias is empty"
else
    export CHAIN_NAME="$CHAIN_ALIAS"
    bash /opt/services/scripts/get_secrets_solana.sh
    cp /var/run/solana/secrets/env  "/var/run/solana/secrets/env.${CHAIN_ALIAS}"    
fi

if ! grep -q "^HOME" "/var/run/solana/secrets/env"; then
    echo "HOME=/home/solana" >> "/var/run/solana/secrets/env"
fi

if ! grep -q "^HOME" "/var/run/solana/secrets/env"; then
    echo "WORKSPACE_DIR=\${STATE_DIRECTORY}" >> "/var/run/solana/secrets/env"
fi
