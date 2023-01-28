Fullt automated solution, with a single vagrant up the whole environment is spinned up and no further actions are needed.
Tech stack:
 - Vagrant
 - Terraform
 - Ansible
 - Puppet
 - Docker
 - Kafka
 - Grafana
 - Prometheus
 - Apache Web server and MariaDB

Kafka monitoring - http://192.168.99.101:3000/ (Grafana is used for visualization of the metrics)
Prometheus UI - http://192.168.99.101:9090/
Kafka Exporter - http://192.168.99.101:9308/metrics
Web Application #1 - http://192.168.99.102:8081/
Web Application #2 - http://192.168.99.102:8082/
