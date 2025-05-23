# aws-ssm-invoke.ps1


. ./instances.ps1

function Main {
    $command = "sudo bash -x /opt/services/scripts/status-solana.sh"    
    $exitCode = Invoke-SSMCommand -InstanceId $instanceId -Command $command -Wait    
}

Main