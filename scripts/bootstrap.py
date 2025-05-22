#!/usr/bin/python3
import time
import boto3

def send_bash_command(ssm_client, instance_id, command):
    """Send a Bash command to an EC2 instance via SSM."""
    try:
        response = ssm_client.send_command(
            InstanceIds=[instance_id],
            DocumentName="AWS-RunShellScript",
            Parameters={"commands": [command]},
            Comment="Clone and bootstrap repository"
        )
        command_id = response['Command']['CommandId']
        print(f"Sent command to {instance_id}, Command ID: {command_id}")
        return command_id
    except Exception as e:
        print(f"Error sending command to {instance_id}: {e}")
        return None

def main():
    region = "us-east-2"
    ec2_client = boto3.client('ec2', region_name=region)
    ssm_client = boto3.client('ssm', region_name=region)

    # Bash one-liner to execute
    bash_command = (
        'bash -c \'BRANCH="origin/main"; DIRECTORY="services"; REPO="meta-introspector/services"; '
        'src="https://github.com/$REPO.git"; dest="/opt/$DIRECTORY/"; '
        'echo "Cloning $src into $dest"; git clone "$src" "$dest" && cd "$dest" && '
        'git fetch --all && git checkout "$BRANCH" && '
        '{ [ -f "./scripts/bootstrap.sh" ] && bash -x "./scripts/bootstrap.sh" || '
        'echo "No bootstrap script found"; }\''
    )

    # Get the list of instance IDs and their states
    instances_response = ec2_client.describe_instances()

    for reservation in instances_response['Reservations']:
        for instance in reservation['Instances']:
            instance_id = instance['InstanceId']
            state = instance['State']['Name']
            if state == 'running':
                print(f"Processing running instance: {instance_id}")
                command_id = send_bash_command(ssm_client, instance_id, bash_command)
                if command_id:
                    print(f"Command sent successfully to {instance_id}")
                else:
                    print(f"Failed to send command to {instance_id}")

if __name__ == "__main__":
    main()