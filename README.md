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

`aws ssm start-session --target i-023d1e2a87031969e --region us-east-2`

```
cd /opt/
git clone https://github.com/meta-introspector/services
cd /opt/services/   
bash ./scripts/rundocker.sh
```

--ws ssm send-command    --instance-ids "i-023d1e2a87031969e"     --document-name "AWS-RunShellScript"    --parameters commands="pushd /opt/services/  && git pull" 

The docker image can be packaged to run in aws or elsewhere