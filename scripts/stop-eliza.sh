
sudo systemctl stop agent-docker.service  || echo failed

sudo journalctl -r -u agent-docker.service -n 1000 || echo failed