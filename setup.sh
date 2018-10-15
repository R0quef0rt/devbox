#!/bin/bash

# apt-get update && apt-get -y install git wget

mkdir -p /srv/salt
mkdir -p /srv/pillar
mkdir -p /etc/salt
mkdir -p /tmp/srv/salt
mkdir -p /tmp/srv/pillar/dev
mkdir -p /tmp/srv/pillar/qa
mkdir -p /tmp/srv/pillar/prod

wget -O bootstrap-salt.sh https://bootstrap.saltstack.com
sh bootstrap-salt.sh -P -U -F \
  -i cloudbox \
  -c /tmp \
  -p python-git \
  -j ${MINION_CONFIG} \
  git v${SALT_VERSION}