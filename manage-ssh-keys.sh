yes y |ssh-keygen -f /home/vagrant/.ssh/id_rsa -t rsa -N ''

sshpass -p vagrant ssh-copy-id master
sshpass -p vagrant ssh-copy-id master2
sshpass -p vagrant ssh-copy-id master3
