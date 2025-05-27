Vagrant.configure("2") do |config|
  # Detect CPU architecture
  arch = `uname -m`.strip
  
  # Set box based on architecture
  if arch == 'arm64'
    config.vm.box = "net9/ubuntu-24.04-arm64"
  else
    config.vm.box = "net9/ubuntu-24.04"
  end
  
  config.vm.hostname = "devops-env"
  config.vm.network "private_network", ip: "192.168.1.100"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 1
  end
  
  # Sync project directory
  config.vm.synced_folder ".", "/vagrant"
  
  # Provision with Ansible
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbooks/deploy.yml"
    ansible.inventory_path = "hosts.ini"
    ansible.verbose = "v"
    ansible.compatibility_mode = "2.0"
    ansible.limit = "all"
  end
end 
