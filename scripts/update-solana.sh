cp "/opt/services/systemd/solana.service" /etc/systemd/system/solana.service 
sudo systemctl daemon-reload
sudo systemctl start solana.service  || echo failed
sudo systemctl enable solana.service  || echo failed
sudo systemctl status solana.service  || echo failed
sudo journalctl -r -u solana.service -n 1000 || echo failed