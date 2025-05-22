#userdata.sh
# this is a simulated user data for injection into a running system
#!/bin/bash -xe
set -x
declare -A services=(
  ["branch"]="main"
  ["directory"]="services"
  ["repo"]="meta-introspector/services"
)

declare -A eliza=(
    ["agent_name"]="tine_agent_9"
  ["branch"]="feature/v2/telegram",
  ["directory"]="services"
  ["repo"]="meta-introspector/cloud-deployment-eliza/"
)

declare -a services_array
services_array[0]="services"
#services_array[1]="eliza"

# Access values (using indirect expansion)
echo ${!services_array[0]["branch"]}  # Outputs: origin/main
echo ${!services_array[1]["directory"]}  # Outputs: services/api


# Loop over services_array
for service_name in "${services_array[@]}"; do
  # Use indirect expansion to access the associative array
  declare -n service="$service_name"

  # Extract values
  repo="${service[repo]}"
  target_dir="${service[directory]}"
  branch="${service[branch]}"
  src="https://github.com/${repo}.git"
  dest="/opt/${target_dir}/"

  # Clone the repository
  echo "Cloning $src into $dest"
  if [[ -d "$dest" ]]; then
    echo "Directory $dest already exists. Skipping clone."
  else
    if ! git clone "$src" "$dest"; then
      echo "Error: Failed to clone $src into $dest"
      continue
    fi    
  fi

  # Change to destination directory
  if ! cd "$dest"; then
    echo "Error: Failed to change to directory $dest"
    continue
  fi

  # Git operations
  git fetch --all
  if ! git checkout "$branch"; then
    echo "Error: Failed to checkout branch $branch"
    pwd
    git status
    continue
  fi

  # Run bootstrap script if it exists
  if [[ -f "./scripts/bootstrap.sh" ]]; then
    echo "Running bootstrap script in $dest"
    if ! bash -x "./scripts/bootstrap.sh"; then
      echo "Error: Bootstrap script failed in $dest"
    fi
  else
    echo "Warning: No bootstrap script found in $dest"
  fi

  # Return to original directory (optional, depending on your needs)
  cd - || exit 1
done