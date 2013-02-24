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

ln -s ~/localrc ~/devstack/localrc

cd devstack/
./stack.sh
