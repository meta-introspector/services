#!/bin/bash
set -x
echo run solana
bash -x /opt/services/scripts/runsolana.sh
echo get secrets
bash -x /opt/services/scripts/get_secrets_solana.sh

echo setup kernel 
bash -x /opt/services/scripts/setup-kernel.sh

echo setup swap
bash -x /opt/services/scripts/setup-swap.sh
