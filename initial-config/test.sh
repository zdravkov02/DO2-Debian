#!/bin/bash

echo "* Run the kafka cluster ..."
terraform -chdir=/vagrant/terraform-1-kafka init
terraform -chdir=/vagrant/terraform-1-kafka apply -auto-approve

echo "* Run the kafka producers and consumers ..."
terraform -chdir=/vagrant/terraform-2-app init
terraform -chdir=/vagrant/terraform-2-app apply -auto-approve

echo "* Run the monitoring components ..."
terraform -chdir=/vagrant/terraform-3-monitoring init
terraform -chdir=/vagrant/terraform-3-monitoring apply -auto-approve