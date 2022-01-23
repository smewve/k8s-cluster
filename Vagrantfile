# _*_ mode: ruby _*_
# vi: set ft=ruby :


  servers = [
    {
      :hostname => "master",
      :ip => "192.168.1.50",
      :network => "public_network",
      :bridge => "enp10s0f1"
    },
    {
      :hostname => "master2",
      :ip => "192.168.1.51",
      :network => "public_network",
      :bridge => "enp10s0f1"
    },
    {
      :hostname => "master3",
      :ip => "192.168.1.52",
      :network => "public_network",
      :bridge => "enp10s0f1"
    }
  ]

  Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu/bionic64"
    config.vm.box_url = "file:///home/vagrant/vagrant_box/virtualbox.box"
    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |vb|
      vb.memory = 6144 
      vb.cpus = 4
    end

    servers.each do |server|
      config.vm.define server[:hostname] do | w |
        w.vm.hostname = server[:hostname]
        w.vm.network server[:network], ip: server[:ip], bridge: server[:bridge]
                
        w.ssh.private_key_path = [".ssh/vagrant_rsa", "~/.vagrant.d/insecure_private_key"]
        w.vm.provision "file", source: ".ssh/vagrant_rsa.pub", destination: "~/.ssh/authorized_keys"
        w.vm.provision "file", source: "./cluster.yml", destination: "/home/vagrant/cluster.yml"
        w.vm.provision "file", source: "./install_helm.sh", destination: "/home/vagrant/install_helm.sh"
        w.vm.provision "file", source: "./install_rancher.sh", destination: "/home/vagrant/install_rancher.sh"
        w.vm.provision "file", source: "./install_cert_mgr.sh", destination: "/home/vagrant/install_cert_mgr.sh"
        w.vm.provision "file", source: "./install_rancher2.sh", destination: "/home/vagrant/install_rancher2.sh"
        w.vm.provision "file", source: "./manage-ssh-keys.sh", destination: "/home/vagrant/manage-ssh-keys.sh"
        w.vm.provision "file", source: "./bootstrap.sh", destination: "/home/vagrant/bootstrap.sh"
        w.vm.provision "file", source: "./install_kubectl.sh", destination: "/home/vagrant/kubectl.sh"
        
        w.vm.provision "setup-hosts", :type => "shell", :path => "general-setup-master.sh" do |s|
        end
        w.vm.provision "shell", inline: <<-SHELL
          apt-get update
          apt-get install -y git wget vim curl sshpass
          chmod 755 /home/vagrant/*.sh
          export VAGRANT_PASSWORWD=#{ENV['VAGRANT_PASSWORD']};
        SHELL
        w.vm.provision "setup-rke", :type => "shell", privileged: false, :path => "rke-setup-master.sh" do |s|
        end
        w.vm.provision "shell", inline: <<-SHELL
          sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
          sed -i 's/PubkeyAuthentication no/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
          systemctl restart sshd.service
        SHELL
      end # end config.vm.define
    end # end servers
#    config.vm.trigger.after :up do |trigger|
#      trigger.name = 'bootstrap'
#      trigger.run_remote = {inline: "/home/vagrant/bootstrap.sh", args: "vagrant"}
#    end
  end
