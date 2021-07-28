#!/bin/bash

echo "!!!!!!!!!!!!!!!!!!!!!!!!!export DEBIAN_FRONTEND=noninteractive "
export DEBIAN_FRONTEND=noninteractive

echo "!!!!!!!!!!!!!!!!!!!!!!!!!apt-get update"
apt-get update
echo "!!!!!!!!!!!!!!!!!!!!!!!!!apt-get install software-properties-common -y"
apt-get install software-properties-common -y
echo "!!!!!!!!!!!!!!!!!!!!!!!!!apt-add-repository ppa:ansible/ansible -y"
apt-add-repository ppa:ansible/ansible -y
echo "!!!!!!!!!!!!!!!!!!!!!!!!!apt-get update"
apt-get update
echo "!!!!!!!!!!!!!!!!!!!!!!!!!apt-get install ansible -y"
apt-get install ansible -y