#!/bin/bash

set -eu
cd `dirname $0`

if vagrant box list | grep base_simple; then
  vagrant box remove base_simple -f
fi
vagrant box add base_simple base_simple.box

if vagrant box list | grep base_docker; then
  vagrant box remove base_docker -f
fi
vagrant box add base_docker base_docker.box

if vagrant box list | grep base_ctf; then
  vagrant box remove base_ctf -f
fi
vagrant box add base_ctf base_ctf.box

