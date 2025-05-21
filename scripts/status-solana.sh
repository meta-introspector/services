
systemctl status solana.service  || echo failed

journalctl -r -u solana.service -n 1000 || echo failed