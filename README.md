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



    C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe 

    git clone https://github.com/meta-introspector/services.git /opt/service/ && bash -x /opt/service/scripts/bootstrap.sh

     aws-ssm-invoke.exe  --instance-ids i-08e0eb40cd783623c  --show-output "bash -x /opt/services/scripts/update-git.sh  && bash -x /opt/services/scripts/status-solana.sh"  

     C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-08e0eb40cd783623c  --wait "sudo bash -x /opt/service/scripts/bootstrap.sh"




       -- -----------
   1 try { . "c:\Users\gentd\AppData\Local\Programs\Microsoft VS Code\resources\app\out\vs\workbench\contrib\terminal\common\scripts\shellIntegration.ps1" } catch {}
   2 aws configure
   3 aws configure --help
   4 aws configure help
   5 aws configure cp "/opt/services/systemd/solana.service" /etc/systemd/system/solana.service
   6 #grep . -h -n /etc/systemd/system/solana-docker.service
   7 chown -R solana:solana /var/run/solana/
   8 chown -R solana:solana /opt/services/
   9 aws configure export-credentials
  10 git clone https://github.com/meta-introspector/services
  11 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe
  12 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-id i-023d1e2a87031969e
  13 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-id i-023d1e2a87031969e  ls
  14 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-id i-023d1e2a87031969e  --show-output ls
  15 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-id i-023d1e2a87031969e  --region us-east-2 --show-output ls
  16 EC:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-id i-023d1e2a87031969e  --region us-east-2 --show-output ls
  17 export REGION=us-east-2
  18 set REGION=us-east-2
  19 EC:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-id i-023d1e2a87031969e  --region us-east-2 --show-output ls
  20 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-id i-023d1e2a87031969e  --region us-east-2 --show-output ls
  21 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-id i-023d1e2a87031969e   --show-output ls
  22 aws config
  23 aws configure
  24 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-id i-023d1e2a87031969e   --show-output ls
  25 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e   --show-output ls
  26 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids=i-023d1e2a87031969e   --show-output ls
  27 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids=i-023d1e2a87031969e  --show-output ls
  28 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output ls
  29 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output ls
  30 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output ls
  31 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output ls
  32 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output ls

     1 try { . "c:\Users\gentd\AppData\Local\Programs\Microsoft VS Code\resources\app\out\vs\workbench\contrib\terminal\common\scripts\shellIntegration.ps1" } catch {}
   2 pip install __future__
   3 pip install absolute_import
   4 pip install argparse
   5 pip install sys
   6 pip install time
   7 pip install each
   8 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output ls
   9 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output ls
  10 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output ls
  11 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output ls
  12 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output hostname
  13 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output ls -latr
  14 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "ls -latr"
  15 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "cd /opt/services && git pull"
  16 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "cd /opt/services && git pull && /opt/services/scripts/runsolana.sh"
  17 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "cd /opt/services && git pull && bash -x /opt/services/scripts/runsolana.sh"       
  18 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "cd /opt/services && git pull && bash -x /opt/services/scripts/update-git.sh"      
  19 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "cd /opt/services && git pull && bash -x /opt/services/scripts/update-git.sh"      
  20 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "cd /opt/services && git pull && bash -x /opt/services/scripts/update-git.sh"      
  21 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "bash -x /opt/services/scripts/update-git.sh  && bash -x /opt/services/scripts/s...
  22 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "bash -x /opt/services/scripts/update-git.sh  && bash -x /opt/services/scripts/s...
  23 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "bash -x /opt/services/scripts/update-git.sh  && bash -x /opt/services/scripts/s...
  24 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output " bash -x /opt/services/scripts/status-solana.sh"
  25 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "bash -x /opt/services/scripts/update-git.sh  && bash -x /opt/services/scripts/s...
  26 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "bash -x /opt/services/scripts/update-git.sh  && bash -x /opt/services/scripts/s...
  27 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "bash -x /opt/services/scripts/update-git.sh  && bash -x /opt/services/scripts/s...
  28 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "bash -x /opt/services/scripts/update-git.sh  && bash -x /opt/services/scripts/s...
  29 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "bash -x /opt/services/scripts/update-git.sh  && bash -x /opt/services/scripts/s...
  30 aws ssm start-session --target i-023d1e2a87031969e --region us-east-2
  31 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "bash -x /opt/services/scripts/update-git.sh  && bash -x /opt/services/scripts/s... 
  32 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "bash -x /opt/services/scripts/update-git.sh  && bash -x /opt/services/scripts/s... 
  33 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "bash -x /opt/services/scripts/update-git.sh  && bash -x /opt/services/scripts/s...
  34 aws ssm start-session --target i-023d1e2a87031969e --region us-east-2
  35 aws ssm start-session --target i-023d1e2a87031969e --region us-east-2
  36 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "bash -x /opt/services/scripts/update-git.sh  && sudo bash -x /opt/services/scri... 
  37 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "bash -x /opt/services/scripts/update-git.sh  && bash -x /opt/services/scripts/s...
  38 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "bash -x /opt/services/scripts/update-git.sh  && sudo bash -x /opt/services/scri... 
  39 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "bash -x /opt/services/scripts/update-git.sh  && sudo bash -x /opt/services/scri... 
  40 C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe  --instance-ids i-023d1e2a87031969e  --show-output "git config --global --add safe.directory /opt/services && bash -x /opt/services...




git commit -m 'update' -a; git push; & ".\bootstrap.ps1"

aws ssm start-session --target i-023d1e2a87031969e --region us-east-2

git commit -m 'update' -a; git push; & ".\start-solana.ps1"