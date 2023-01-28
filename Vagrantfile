# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    
  config.ssh.insert_key = false

  config.vm.define "docker" do |docker|
    docker.vm.box = "shekeriev/debian-11"
    docker.vm.hostname = "docker"
    docker.vm.network "private_network", ip: "192.168.99.101"
    docker.vm.provision "shell", path: "initial-config/terraform_setup.sh"
    docker.vm.provision "shell", path: "initial-config/ansible_req.sh"
    docker.vm.provision "ansible_local" do |ansible|
      ansible.become = true
      ansible.install_mode = :default
      ansible.playbook = "initial-config/playbook.yml"
      ansible.galaxy_role_file = "initial-config/requirements.yml"
      ansible.galaxy_roles_path = "/etc/ansible/roles"
      ansible.galaxy_command = "sudo ansible-galaxy install --role-file=%{role_file} --roles-path=%{roles_path} --force"
    end
    docker.vm.provision "shell", path: "initial-config/test.sh"
    docker.vm.provider "virtualbox" do |v|
      v.gui = false
      v.memory = 2048
      v.cpus = 2
    end
  end

  config.vm.define "web" do |web|
    web.vm.box = "shekeriev/debian-11"
    web.vm.hostname = "web"
    web.vm.network "private_network", ip: "192.168.99.102"
    web.vm.provision "shell", path: "initial-config/puppet_setup.sh", privileged: false
    web.vm.provision "shell", path: "initial-config/modules_web.sh", privileged: false
    
    web.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "web.pp"
      puppet.options = "--verbose --debug"
    end
  end

  config.vm.define "db" do |db|
    db.vm.box = "shekeriev/debian-11"
    db.vm.hostname = "db"
    db.vm.network "private_network", ip: "192.168.99.103"
    db.vm.provision "shell", path: "initial-config/puppet_setup.sh", privileged: false
    db.vm.provision "shell", path: "initial-config/modules_db.sh", privileged: false

    db.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "db.pp"
      puppet.options = "--verbose --debug"
    end
  end

end