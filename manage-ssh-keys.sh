yes y |ssh-keygen -f /home/vagrant/.ssh/id_rsa -t rsa -N ''

sudo sshpass -p $1 ssh-copy-id -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa.pub vagrant@master
sudo sshpass -p $1 ssh-copy-id -o StrictHostkeyChecking=no -i ~/.ssh/id_rsa.pub vagrant@master2
sudo sshpass -p $1 ssh-copy-id -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa.pub vagrant@master3

