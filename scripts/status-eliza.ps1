# aws-ssm-invoke.ps1

function Invoke-SSMCommand {
    param (
        [Parameter(Mandatory=$true)]
        [string]$InstanceId,
        
        [Parameter(Mandatory=$true)]
        [string]$Command,
        
        [string]$Executable = "C:\users\gentd\appdata\roaming\python\python312\Scripts\aws-ssm-invoke.exe",
        
        [switch]$Wait
    )

    try {
        $arguments = "--instance-ids $InstanceId --show-output"
        if ($Wait) {
            $arguments += " --wait"
        }
        $arguments += " `"$Command`""

        $process = Start-Process -FilePath $Executable -ArgumentList $arguments -NoNewWindow -PassThru -Wait
        return $process.ExitCode
    }
    catch {
        Write-Error "Failed to execute SSM command: $_"
        return 1
    }
}

. ./instances.ps1
function Main {
    $command = "sudo bash -x /opt/services/scripts/status-eliza.sh"    
    $exitCode = Invoke-SSMCommand -InstanceId $instanceId -Command $command -Wait    
}

Main