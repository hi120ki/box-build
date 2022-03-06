#!/bin/bash

set -eu
cd `dirname $0`

git -C provision pull

vagrant box update
vagrant up
vagrant halt

if [ -e "base_simple.box" ]; then
  rm base_simple.box
fi
vagrant package simple --output base_simple.box
if vagrant box list | grep base_simple; then
  vagrant box remove base_simple -f
fi
vagrant box add base_simple base_simple.box

if [ -e "base_docker.box" ]; then
  rm base_docker.box
fi
vagrant package docker --output base_docker.box
if vagrant box list | grep base_docker; then
  vagrant box remove base_docker -f
fi
vagrant box add base_docker base_docker.box

if [ -e "base_ctf.box" ]; then
  rm base_ctf.box
fi
vagrant package ctf --output base_ctf.box
if vagrant box list | grep base_ctf; then
  vagrant box remove base_ctf -f
fi
vagrant box add base_ctf base_ctf.box

vagrant destroy -f
