#userdata.sh
# this is a simulated user data for injection into a running system
#!/bin/bash -xe
set -x
# we remove all services for now, this is the second bootstrap. everything should be up to date now.
declare -A services=(
  ["branch"]="main"
  ["directory"]="services"
  ["repo"]="meta-introspector/services"
  ["script"]="scripts/bootstrap_f.sh" # bootstrap calls bootstrap2 to avoid infinite loops
)

declare -A eliza=(
    ["agent_name"]="tine_agent_9"
  ["branch"]="feature/v2/telegram",
  ["directory"]="services"
  ["repo"]="meta-introspector/cloud-deployment-eliza/"
)

declare -a services_array
#services_array[0]="services"
#services_array[1]="eliza"

# Access values (using indirect expansion)
echo ${!services_array[0]["branch"]}  # Outputs: origin/main
echo ${!services_array[1]["directory"]}  # Outputs: services/api


. ./bootstrap_common.sh

bootstrap()