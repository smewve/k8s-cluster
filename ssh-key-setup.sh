# Add ssh key to help cloning private github repo

ssh-keygen -t rsa -N "" -f .ssh/vagrant_rsa
PUB_KEY=$(cat .ssh/vagrant_rsa.pub)
PRV_KEY=$(cat .ssh/vagrant_rsa)

echo "${PRV_KEY}" >> ~/.ssh/vagrant_rsa
chmod 600 ~/.ssh/vagrant_rsa
eval $(ssh-agent)
ssh-add ~/.ssh/vagrant_rsa

ssh-keyscan 192.168.1.50 >> ~/.ssh/known_hosts
ssh-keyscan 192.168.1.51 >> ~/.ssh/known_hosts
ssh-keyscan 192.168.1.52 >> ~/.ssh/known_hosts
echo IdentityFile ~/.ssh/vagrant_rsa >> ~/.ssh/config

echo "Paste the following public key to your host machine ".${PUB_KEY}
