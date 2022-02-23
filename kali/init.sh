#!/bin/bash

set -eu

(cd provision ; git pull)

vagrant box update
vagrant up
vagrant halt
vagrant package
vagrant box remove base_kali -f
vagrant box add base_kali package.box
vagrant destroy -f

rm base_kali.box
mv package.box base_kali.box
