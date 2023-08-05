#!/bin/bash

set -eu
cd "$(dirname "$0")"

function add_or_replace_box() {
  local base_name=$1

  if vagrant box list | grep "base_${base_name}_20"; then
    vagrant box remove "base_${base_name}_20" -f
  fi
  vagrant box add "base_${base_name}_20" "base_${base_name}_20.box"
}

base_names=("simple" "docker" "ctf")

for base_name in "${base_names[@]}"; do
  add_or_replace_box "$base_name"
done
