
sudo systemctl daemon-reload
sudo systemctl start solana.service  || echo failed
sudo systemctl enable solana.service  || echo failed
#systemctl status agent-docker || echo oops2
