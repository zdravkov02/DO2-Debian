#!/bin/bash

echo "* Update cache ..."
apt update -y

echo "* Install Python3 ..." 
apt install -y python3 python3-pip

echo "* Install Python docker module ..."
pip3 install docker