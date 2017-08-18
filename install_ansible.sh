apt-get update
apt install python-pip git
pip install ansible
git clone https://github.com/urosorozel/ansible_cobbler.git
ssh-keygen -f ~/.ssh/id_rsa  -t rsa -N ''
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

