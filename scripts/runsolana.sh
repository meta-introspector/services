#!/bin/bash
# this is the install script 
#  install_script = "/opt/services/runsolana.sh"
# called on boot.
if [ ! -f /etc/solana ];
then
   mkdir -p /etc/solana
fi

if [ ! -f /etc/solana/env ];
then
    touch /etc/solana/env    
fi


source /etc/solana/env
export CHAIN_NAME
echo using "${CHAIN_NAME}" as solana name base for keys
set -e # stop  on any error
export WORKSOURCE="/opt/solana" 

echo for now install helper tools
#snap install aws-cli --classic
mkdir -p /opt/aws/
if [ -f "/opt/aws/awscliv2.zip" ];
then
    echo "awscliv2.zip already exists, skipping download"
else
    cd /opt/aws/
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/opt/aws/awscliv2.zip"
fi


if [ ! -f "/opt/aws/aws/install" ];
then
    cd /opt/aws/
    unzip ./awscliv2.zip
fi  

if [ ! -f /usr/local/bin/aws ]; 
then
    /opt/aws/aws/install
fi

apt install -y jq
apt install -y lsof strace nmap


#mkdir -p /opt/solana
mkdir -p /opt/solana/archives
mkdir -p /var/db/solana/
#  sh -c "$(curl -sSfL https://release.anza.xyz/v2.2.14/install)"

if [ -f /opt/solana/archives/solana-release-aarch64-unknown-linux-gnu.tar.bz2 ]; then
    echo "solana-release-aarch64-unknown-linux-gnu.tar.bz2 already exists, skipping download"
else    
    cd /opt/solana/archives/
    wget https://github.com/staratlasmeta/agave-dist/releases/download/v2.2.13/solana-release-aarch64-unknown-linux-gnu.tar.bz2
    
fi

cd /opt/solana/
tar -xvjf archives/solana-release-aarch64-unknown-linux-gnu.tar.bz2

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

#echo get secrets
#dos2unix  /opt/services/scripts/get_secrets_solana.sh
#snap install aws-cli --classic

cp "/opt/services/systemd/solana.service" /etc/systemd/system/solana.service 
#grep . -h -n /etc/systemd/system/solana-docker.service
chown -R solana:solana /var/run/solana/
chown -R solana:solana /opt/services/

chown -R solana:solana /var/db/solana/