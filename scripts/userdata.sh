# fake user data for the docker file

#!/bin/bash -xe
export AGENT_NAME="AgentCodeName"
export CHAIN_NAME="ChainName"
export GIT_REPO="https://github.com/meta-introspector/services/" # FIXME
export GIT_BRANCH="deployment/v0.0.1-solana-test-validator" # FIXME
mkdir /etc/solana/              
echo AGENT_NAME="${AGENT_NAME}" > /etc/solana/env
echo CHAIN_NAME="${CHAIN_NAME}" >> /etc/solana/env
echo GIT_REPO="${GIT_REPO}" >> /etc/solana/env
echo GIT_BRANCH="${GIT_BRANCH}"  >> /etc/solana/env
export HOME=/root
apt update
apt-get install -y ec2-instance-connect git wget unzip systemd curl
apt-get install -y cloud-utils apt-transport-https ca-certificates curl software-properties-common              
apt-get update              
snap install amazon-ssm-agent --classic || echo oops1
snap start amazon-ssm-agent || echo oops2
if [ ! -d "/opt/services/" ]; then
    git clone "${GIT_REPO}" "/opt/services/"
fi
cd "/opt/services/" || exit 1
git stash
git fetch --all
git checkout --track --force "origin/${GIT_BRANCH}"
bash -x /opt/services/scripts/bootstrap.sh

            