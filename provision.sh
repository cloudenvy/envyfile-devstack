#!/bin/bash

# Skip ssh new host check.
cat<<EOF | sudo tee ~/.ssh/config
Host *
  StrictHostKeyChecking no
  UserKnownHostsFile /dev/null
  User ubuntu
EOF

sudo apt-get update
sudo apt-get install -y git python-netaddr

git clone https://github.com/openstack-dev/devstack.git #-b stable/essex

cd devstack/

cat<<LOCALRC | tee localrc
FIXED_RANGE=192.168.2.0/24
MYSQL_PASSWORD=secrete
RABBIT_PASSWORD=secrete
SERVICE_TOKEN=secrete
SERVICE_PASSWORD=secrete
ADMIN_PASSWORD=secrete
LOCALRC

./stack.sh
