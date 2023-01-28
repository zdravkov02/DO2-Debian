#!/bin/bash

echo "* Installing puppet modules  for Web VM ..."
puppet module install puppetlabs-vcsrepo
puppet module install puppetlabs-firewall
sudo cp -vR ~/.puppetlabs/etc/code/modules/ /etc/puppetlabs/code/