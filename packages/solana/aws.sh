
mkdir -p /opt/solana
mkdir -p /var/db/solana/
cd /opt/solana/
#  sh -c "$(curl -sSfL https://release.anza.xyz/v2.2.14/install)"
wget https://github.com/staratlasmeta/agave-dist/releases/download/v2.2.13/solana-release-aarch64-unknown-linux-gnu.tar.bz2
tar -xjf solana-release-aarch64-unknown-linux-gnu.tar.bz2
#rm solana-release-aarch64-unknown-linux-gnu.tar.bz2
cd  /opt/solana/solana-release/
   
#bin//solana-test-validator   
   #51  ./solana config get
#./solana-release/bin/solana-test-validator -u localhost

# read https://www.helius.dev/blog/how-to-set-up-a-solana-validator
# https://nox.im/posts/2021/1229/solana-on-the-raspberry-pi/#systemd-service-file-for-the-solana-validator
# https://solana.com/developers/guides/getstarted/solana-test-validator
# https://docs.anza.xyz/cli/install/
# https://docs.anza.xyz/cli/examples/test-validator/
# https://docs.anza.xyz/operations/setup-a-validator/