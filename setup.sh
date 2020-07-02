#!/usr/bin/env bash
dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
cd ${dir}

virtualenv -p python3 env
source env/bin/activate
pip install -r requirements.txt

