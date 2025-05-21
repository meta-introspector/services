#!/bin/bash
# we are using parameters prefixed by ${CHAIN_NAME}_, eg. "tine_CHAIN_7_"
## TURN OFF LOGGING
echo using "${CHAIN_NAME}" as chain name base for keys
set +e

# This script expects CHAIN_NAME to be set to something like "tine_chain"

mkdir -p "/var/run/solana/secrets/"
echo "" > "/var/run/solana/secrets/env" # blank the file

# Fetch all variables with the prefix and name them the same as the variable minus solana name underscore
for key in $(aws ssm describe-parameters --query 'Parameters[?starts_with(Name, `'"${CHAIN_NAME}"'_`)].Name' --output text); do
    value=$(aws ssm get-parameter --name "$key" | jq .Parameter.Value -r)
    var_name=$(echo "$key" | sed "s/^${CHAIN_NAME}_//")
    echo "$var_name=${value}" >> "/var/run/solana/secrets/env"
done

# append these constant values to the env 
declare -A params_const=(       
)
for key in "${!params_const[@]}"; do
    value="${params_const[$key]}"
    echo "$key=$value" >> "/var/run/solana/secrets/env"
done

set -x
## TURN ON LOGGING
