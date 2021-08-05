Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"
  config.vm.disk :disk, size: "100GB", primary: true
  config.vm.network "private_network", ip: "192.168.50.4"

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = "2"
    vb.memory = "10240"
  end

end
