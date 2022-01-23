#These dont work.  Need to refactor to a script that copies from the vms to the host then updates each node with the other keys.

sshpass ENV['VAGRANT_PASSWORD'] ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@master
sshpass ENV['VAGRANT_PASSWORD'] ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@master2
sshpass ENV['VAGRANT_PASSWORD'] ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@master3
