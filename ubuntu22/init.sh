#!/bin/bash

set -eu
cd "$(dirname "$0")"

git -C provision pull

function package_and_add_box() {
  local base_name=$1

  if [ -e "base_${base_name}_22.box" ]; then
    rm "base_${base_name}_22.box"
  fi
  vagrant package "$base_name" --output "base_${base_name}_22.box"

  if vagrant box list | grep "base_${base_name}_22"; then
    vagrant box remove "base_${base_name}_22" -f
  fi
  vagrant box add "base_${base_name}_22" "base_${base_name}_22.box"
}

vagrant destroy -f
vagrant box update --force
vagrant up
vagrant halt

base_names=("simple" "docker" "ctf")

for base_name in "${base_names[@]}"; do
  package_and_add_box "$base_name"
done

vagrant destroy -f
