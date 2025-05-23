#userdata.sh
# this is a simulated user data for injection into a running system
#!/bin/bash -xe
set -x
declare -A solana=(
  ["branch"]="deployment/v0.0.1-solana-test-validator"
  ["directory"]="services"
  ["repo"]="meta-introspector/services"
  ["script"]="scripts/setup-solana.sh" # bootstrap calls bootstrap2 to avoid infinite loops
)

declare -a services_array
#services_array[0]="services"
services_array[1]="solana"
# Loop over services_array
for service_name in "${services_array[@]}"; do
  # Use indirect expansion to access the associative array
  declare -n service="$service_name"

  # Extract values
  repo="${service[repo]}"
  target_dir="${service[directory]}"
  branch="${service[branch]}"
  script="${service[script]}"
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
  git pull 
  git remote -v
  git status
  # Run bootstrap script if it exists
  if [[ -f "${dest}/${script}" ]]; then
    echo "Running bootstrap script ${script} in $dest"
    if ! bash -x ${dest}/${script}; then
      echo "Error: Bootstrap script failed in $dest"
    fi
  else
    echo "Warning: No bootstrap script found in ${dest}/${script}"
  fi

  # Return to original directory (optional, depending on your needs)
  cd - || exit 1
done