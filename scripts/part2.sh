set +e
set -x

#cp "${WORKSOURCE}/systemd/solana-docker.service" /etc/systemd/system/solana-docker.service 

cp "/opt/services/systemd/solana.service" /etc/systemd/system/solana.service 
#grep . -h -n /etc/systemd/system/solana-docker.service
chown -R solana:solana /var/run/solana/
chown -R solana:solana /opt/services/

