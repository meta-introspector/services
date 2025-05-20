#!/bin/bash
echo Hello
# this is the install script 
#  install_script = "/opt/services/runsolana.sh"
# called on boot.
if [ ! -f /etc/solana/env ];
then
    touch /etc/solana/env    
fi


sour    ce /etc/solana/env
export CHAIN_NAME
echo using "${CHAIN_NAME}" as solana name base for keys
set -e # stop  on any error
export WORKSOURCE="/opt/solana"

echo for now install helper tools
#snap install aws-cli --classic
apt install -y jq
apt install -y lsof strace nmap


mkdir -p /opt/solana
mkdir -p /var/db/solana/
#  sh -c "$(curl -sSfL https://release.anza.xyz/v2.2.14/install)"

if [ -f /opt/solana/solana-release-aarch64-unknown-linux-gnu.tar.bz2 ]; then
    echo "solana-release-aarch64-unknown-linux-gnu.tar.bz2 already exists, skipping download"
else    
    cd /opt/solana/
    wget https://github.com/staratlasmeta/agave-dist/releases/download/v2.2.13/solana-release-aarch64-unknown-linux-gnu.tar.bz2
    tar -xjf solana-release-aarch64-unknown-linux-gnu.tar.bz2
fi
#rm solana-release-aarch64-unknown-linux-gnu.tar.bz2
cd  /opt/solana/solana-release/

#apt install -y emacs-nox

if ! id -u solana > /dev/null 2>&1; then
    adduser --disabled-password --gecos "" solana --home "/home/solana"  || echo ignore
else
  echo "User solana already exists, ignoring..."
fi

git config --global --add safe.directory "/opt/solana"
cd "/opt/services/" || exit 1 # "we need chain"
#git log -1 
mkdir -p "/home/solana"
mkdir -p "/var/solana/logs"
chown -R solana:solana "/var/solana/" "/home/solana" "/opt/services"
mkdir -p "/var/run/solana/secrets/"

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

#cp "${WORKSOURCE}/systemd/solana-docker.service" /etc/systemd/system/solana-docker.service 
cp "${WORKSOURCE}/systemd/solana.service" /etc/systemd/system/solana.service 
#grep . -h -n /etc/systemd/system/solana-docker.service
chown -R solana:solana /var/run/solana/
chown -R solana:solana /opt/services/
systemctl daemon-reload

# now we can kill any existing
docker stop solana.service || echo oops
docker kill solana.service || echo oops
docker rm solana.service || echo oops

systemctl start solana || echo failed
systemctl enable solana || echo failed
#systemctl status solana-docker || echo oops2
