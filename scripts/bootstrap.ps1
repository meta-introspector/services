# aws-ssm-invoke.ps1

. ./instances.ps1

function SetupGit {    
    $command = "sudo bash -x -c 'git config --global --add safe.directory /opt/services'"       
    $exitCode = Invoke-SSMCommand -InstanceId $instanceId -Command $command -Wait    
}


function StopDocker {    
    $command = "sudo bash -x -c 'systemctl stop docker docker.socket containerd snapd snapd.socket'"
    $exitCode = Invoke-SSMCommand -InstanceId $instanceId -Command $command -Wait    
}


function SSH {
    # fixme use a variable
    $command = "sudo bash -x -c 'echo ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDC01R1oynoYvvVmeqNZunjqDvlB37iKpMRtD9DMH0w1jTV0dO4w7v8q+XodcEDyzEIJ8Gwdf/bELVCsBoWz+OaqIv84AfLRmm4vEJ15sqlZSb/rOoWXD68YmHFbr0xS2v4K0tEY82dw4f2ZaV2LbMWUGlvyzYFL7h6a1ck+4HSccEDzc9cVqCbkVXsz602sF8zlDw5y6WLpK+erYtAnNLd6jL96KvaIP4ssgR2TQoPqiMSZaPQasO2hG7X1mEgl8arA61yNsrdgZwGoZWVctIS2S1KeW9u3lYcCGBl59fQQxwrrwbjaLnwgqR8YPF2QpMfRTJUSZc7KsZFNrLL3+uFmhpdDSOB2mb0ONFu3x0nezdba0M18kzxkiz7SwXy9GQhYPoRRb75XuJbErvAQaYQRlQzVtPXr0kXrVAgmq/TXF6NJsJ1SV6h/K4FDlum10fa/f5MZ95MoaRvpoNq5WPTVv7go7j8y3TbwZabRso5OEM73y3bWMwzmFmDMeXlfiU= >>/home/ubuntu/.ssh/authorized_keys' " 
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

StopDocker
SetupGit
Clone
SSH 
Update
# Execute the main function
Main