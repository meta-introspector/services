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



function SetupGit {    
    $command = "sudo bash -x -c 'git config --global --add safe.directory /opt/services'"       
    $exitCode = Invoke-SSMCommand -InstanceId $instanceId -Command $command -Wait    
}

function Clone {
    $command = "sudo bash -x -c 'git clone https://github.com/meta-introspector/services.git /opt/service/'" 
    $exitCode = Invoke-SSMCommand -InstanceId $instanceId -Command $command -Wait
}

function Update {
    $command = "sudo bash -x -c 'cd /opt/service/ && git pull'" 
    $exitCode = Invoke-SSMCommand -InstanceId $instanceId -Command $command -Wait
}

function Main {
    $command = "sudo bash -x /opt/service/scripts/bootstrap.sh"    
    $exitCode = Invoke-SSMCommand -InstanceId $instanceId -Command $command -Wait    
}

#SetupGit
#Clone

Update
# Execute the main function
Main