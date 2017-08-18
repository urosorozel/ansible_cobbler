# ansible_cobbler
Ansible Cobbler deployment on Ubuntu 16 inside LXC container

How to use
* git clone https://github.com/urosorozel/ansible_cobbler.git
* cd ansible_cobbler && ./install_ansible.sh
* update hosts file with your server ip and lxc container ip
* update group_vars

LXC host variables
```
# LXC host vars
lxc_host_default_if: ens3
dns_nameservers: 8.8.8.8

# Cobbler LXC vars
lxc_cobbler_proxy_list: "{{ global_environment_variables }}"
#lxc_cobbler.lxc_cobbler_config
lxc_cobbler_build:
  lxc_name: cobbler
  state: started
  template: ubuntu
  template_options: --release xenial
  allow_loop: True
  lxc_cobbler_config:
  - device: eth1
    lxc_network_flags: up
    lxc_network_link: br-host
    lxc_network_hwaddr: 00:16:3e:xx:xx:xx
    lxc_network_ipv4: 10.10.10.120/24
    #lxc_network_ipv4_gateway: 10.10.10.1
```

Cobbler server variables
```
#ubuntu_distro_name: ubuntu-16.04.3-server-amd64
ubuntu_distro_name: ubuntu-16.04.3-server-x86_64

cobbler_source_dir: cobbler-2.8.1
cobbler_source_file: v2.8.1.tar.gz
cobbler_source_url: https://github.com/cobbler/cobbler/archive/{{ cobbler_source_file }}
# openssl rand 100000 | sha1sum| awk '{print $1}'for below key
cobbler_secret_key: 69daebf5bb45e5a33795b9e3fdfa649267427c07
cobbler_dhcp_interface: eth1
cobbler_network: 10.10.10.0
cobbler_netmask: 255.255.255.0
cobbler_gateway: 10.10.10.1
cobbler_nameservers: 10.10.10.1
cobbler_boot_range: 10.10.10.100 10.10.10.150


cobbler_ubuntu_profile: "{{ ubuntu_distro_name }}"
cobler_ubuntu_kickstart: /var/lib/cobbler/kickstarts/ubuntu-server-xenial-unattended-cobbler-rpc.seed
# Configure tty via serial
cobbler_tty_enabled: True
cobbler_tty: ttyS0
``` 

* run ansible-playbook -i hosts site.yml
