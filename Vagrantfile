Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
    config.vm.box_url = "file:///home/vagrant/vagrant_box/virtualbox.box"
    config.vm.network "forwarded_port", guest: 80, host: 8080
    config.ssh.insert_key = false
    config.ssh.private_key_path = [".ssh/vagrant_rsa", "~/.vagrant.d/insecure_private_key"]
    config.vm.provision "file", source: ".ssh/vagrant_rsa.pub", destination: "~/.ssh/authorized_keys"
    config.vm.provision "file", source: "./cluster.yml", destination: "/home/vagrant/cluster.yml"
    #config.vm.provision "file", source: ".bash_aliases", destination: "/home/vagrant"

    config.vm.define "master" do | w |
        w.vm.hostname = "master"
        w.vm.network "public_network", ip: "192.168.1.210", bridge: "enp10s0f0"
        w.vm.provider "virtualbox" do |vb|
            vb.memory = "4096"
            vb.cpus = 2
            vb.name = "master"
        end
        w.vm.provision "setup-hosts", :type => "shell", :path => "general-setup-master.sh" do |s|
        end
        w.vm.provision "setup-rke", :type => "shell", privileged: false, :path => "rke-setup-master.sh" do |s|
        end
        w.vm.provision "shell", inline: <<-SHELL
            apt-get update
            apt-get install -y git wget vim curl
        SHELL
    end
end
