Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
    config.vm.box_url = "file:///home/vagrant/vagrant_box/virtualbox.box"
    config.ssh.insert_key = false
    config.ssh.private_key_path = [".ssh/vagrant_rsa", "~/.vagrant.d/insecure_private_key"]
    config.vm.provision "file", source: ".ssh/vagrant_rsa.pub", destination: "~/.ssh/authorized_keys"
    config.vm.provision "file", source: "./cluster.yml", destination: "/home/vagrant/cluster.yml"
    config.vm.provision "file", source: "./install_helm.sh", destination: "/home/vagrant/install_helm.sh"
    config.vm.provision "file", source: "./install_rancher.sh", destination: "/home/vagrant/install_rancher.sh"
    config.vm.provision "file", source: "./install_cert_mgr.sh", destination: "/home/vagrant/install_cert_mgr.sh"
    config.vm.provision "file", source: "./install_rancher2.sh", destination: "/home/vagrant/install_rancher2.sh"
config.vm.provision "file", source: "./copy-ssh-keys.sh", destination: "/home/vagrant/copy-ssh-keys.sh"
    config.vm.define "master" do | w |
        w.vm.hostname = "master"
        #w.vm.network "public_network", ip: "192.168.33.13", bridge: "enp10s0f0"
        w.vm.network "public_network", ip: "192.168.1.50", bridge: "enp10s0f0"
        w.vm.provider "virtualbox" do |vb|
            vb.memory = "4096"
            vb.cpus = 2
            vb.name = "master"
        end
        w.vm.provision "shell", inline: <<-SHELL
            apt-get update
            apt-get install -y git wget vim curl
        SHELL
        w.vm.provision "setup-hosts", :type => "shell", :path => "general-setup-master.sh" do |s|
        end
        w.vm.provision "setup-rke", :type => "shell", privileged: false, :path => "rke-setup-master.sh" do |s|
        end
 
    end

    config.vm.define "master2" do | w |
        w.vm.hostname = "master2"
        w.vm.network "public_network", ip: "192.168.1.51", bridge: "enp10s0f0"
        w.vm.provider "virtualbox" do |vb|
            vb.memory = "4096"
            vb.cpus = 2
            vb.name = "master2"
        end
        w.vm.provision "shell", inline: <<-SHELL
            apt-get update
            apt-get install -y git wget vim curl
        SHELL
        w.vm.provision "setup-hosts", :type => "shell", :path => "general-setup-master.sh" do |s|
        end
        w.vm.provision "setup-rke", :type => "shell", privileged: false, :path => "rke-setup-master.sh" do |s|
        end
 
    end

     config.vm.define "master3" do | w |
        w.vm.hostname = "master3"
        w.vm.network "public_network", ip: "192.168.1.52", bridge: "enp10s0f0"
        w.vm.provider "virtualbox" do |vb|
            vb.memory = "4096"
            vb.cpus = 2
            vb.name = "master3"
        end
        w.vm.provision "shell", inline: <<-SHELL
            apt-get update
            apt-get install -y git wget vim curl
        SHELL
        w.vm.provision "setup-hosts", :type => "shell", :path => "general-setup-master.sh" do |s|
        end
        w.vm.provision "setup-rke", :type => "shell", privileged: false, :path => "rke-setup-master.sh" do |s|
        end
 
    end

   
end
