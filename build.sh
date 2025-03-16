#!/bin/bash

set -eu
cd `dirname $0`

bash ubuntu22/init.sh
bash ubuntu24/init.sh
