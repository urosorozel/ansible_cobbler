apt-get update
apt install -y  python-pip
pip install  ansible
ssh-keygen -f ~/.ssh/id_rsa  -t rsa -N ''
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

