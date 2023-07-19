#!/bin/bash

set -eu
cd `dirname $0`

git -C provision pull

vagrant destroy -f
vagrant box update --force
vagrant up
vagrant halt

if [ -e "base_simple_22.box" ]; then
  rm base_simple_22.box
fi
vagrant package simple --output base_simple_22.box
if vagrant box list | grep base_simple_22; then
  vagrant box remove base_simple_22 -f
fi
vagrant box add base_simple_22 base_simple_22.box

if [ -e "base_docker_22.box" ]; then
  rm base_docker_22.box
fi
vagrant package docker --output base_docker_22.box
if vagrant box list | grep base_docker_22; then
  vagrant box remove base_docker_22 -f
fi
vagrant box add base_docker_22 base_docker_22.box

if [ -e "base_ctf_22.box" ]; then
  rm base_ctf_22.box
fi
vagrant package ctf --output base_ctf_22.box
if vagrant box list | grep base_ctf_22; then
  vagrant box remove base_ctf_22 -f
fi
vagrant box add base_ctf_22 base_ctf_22.box

vagrant destroy -f
