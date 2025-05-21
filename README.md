# services
SystemD Services for introspector

# apps

## solana test validator
## eliza
## swarms


# Entry point
Entry point is /opt/services/rundocker.sh 
from this repo scripts/rundocker.sh

# ssh to ssh via
`ssh-ssm.py`

`
aws ssm start-session --target i-023d1e2a87031969e --region us-east-2

`

```
cd /opt/
ocd /opt/services/   
bash ./scripts/rundocker.sh
```

--ws ssm send-command    --instance-ids "i-023d1e2a87031969e"     --document-name "AWS-RunShellScript"    --parameters commands="pushd /opt/services/  && git pull" 

The docker image can be packaged to run in aws or elsewhere


   21  apt remove docker
   22  for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
   23  # Add Docker's official GPG key:
   24  sudo apt-get update
   25  sudo apt-get install ca-certificates curl
   26  sudo install -m 0755 -d /etc/apt/keyrings
   27  sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
   28  sudo chmod a+r /etc/apt/keyrings/docker.asc
   29  # Add the repository to Apt sources:
   30  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   31  sudo apt-get update
   32  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   33  history

https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/
https://dev.to/klo2k/run-docker-in-wsl2-in-5-minutes-via-systemd-without-docker-desktop-28gi
https://noobient.com/2023/03/13/using-systemd-in-docker/
https://docs.docker.com/engine/install/debian/


docker run -d  -p 8089:80 -v /webpages/:/var/www/html --name systemd_websrv centos /sbin/init

docker run -v /sys/fs/cgroup/:/sys/fs/cgroup:ro --cap-add SYS_ADMIN -it solana


   24  ./get_secrets_solana.sh
   25  bash -x ./get_secrets_solana.sh
   26  export CHAIN_NAME=tine_agent
   27  bash -x ./get_secrets_solana.sh
   28  export AWS_REGION=us-east-2
   29  bash -x ./get_secrets_solana.sh
   30  #bash -x ./get_secrets_solana.sh


    C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe 