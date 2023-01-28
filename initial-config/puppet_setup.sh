#!/bin/bash

echo "* Installing puppet for Debian ..."

sudo wget https://apt.puppet.com/puppet7-release-bullseye.deb -O repository.deb
sudo dpkg -i repository.deb
sudo apt-get update
sudo apt-get install -y puppetserver