#!/bin/bash

set -eu
cd `dirname $0`

if vagrant box list | grep base_simple_20; then
  vagrant box remove base_simple_20 -f
fi
vagrant box add base_simple_20 base_simple_20.box

if vagrant box list | grep base_docker_20; then
  vagrant box remove base_docker_20 -f
fi
vagrant box add base_docker_20 base_docker_20.box

if vagrant box list | grep base_ctf_20; then
  vagrant box remove base_ctf_20 -f
fi
vagrant box add base_ctf_20 base_ctf_20.box
