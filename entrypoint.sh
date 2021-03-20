#!/usr/bin/env sh
set -eu

for YC_VARS in $("$YC_BIN", "$YC_CONF", "$YC_CLOUD_ID", "$YC_FOLDER_ID", "$YC_OAUTH_TOKEN", "$YC_DATACENTER"); do
  if [ -z $1 ]; then
    echo "Cant find $1"
    exit 1
  fi
done
