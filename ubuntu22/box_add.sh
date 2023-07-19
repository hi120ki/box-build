#!/bin/bash

set -eu
cd `dirname $0`

if vagrant box list | grep base_simple_22; then
  vagrant box remove base_simple_22 -f
fi
vagrant box add base_simple_22 base_simple_22.box

if vagrant box list | grep base_docker_22; then
  vagrant box remove base_docker_22 -f
fi
vagrant box add base_docker_22 base_docker_22.box

if vagrant box list | grep base_ctf_22; then
  vagrant box remove base_ctf_22 -f
fi
vagrant box add base_ctf_22 base_ctf_22.box
