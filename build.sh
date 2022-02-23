#!/bin/bash

set -eu
cd `dirname $0`

bash ubuntu/init.sh > /dev/null 2>&1
bash kali/init.sh > /dev/null 2>&1
