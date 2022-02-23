#!/bin/bash

set -eu
cd `dirname $0`

git -C provision pull

vagrant box update
vagrant up
vagrant halt

if [ -e "base_kali.box" ]; then
  rm base_kali.box
fi
vagrant package --output base_kali.box
if vagrant box list | grep base_kali; then
  vagrant box remove base_kali -f
fi
vagrant box add base_kali base_kali.box

# vagrant destroy -f
