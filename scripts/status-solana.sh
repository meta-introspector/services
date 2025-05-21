
sudo systemctl status solana.service  || echo failed

sudo journalctl -r -u solana.service -n 1000 || echo failed