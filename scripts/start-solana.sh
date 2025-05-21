
systemctl start solana.service  || echo failed
systemctl enable solana.service  || echo failed
#systemctl status agent-docker || echo oops2
