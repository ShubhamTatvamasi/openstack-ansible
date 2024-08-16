# openstack-ansible

Source Code: https://docs.openstack.org/openstack-ansible/2024.1/user/aio/quickstart.html

Step | Task | Link
---|---|---
1 | Prepare the deployment host | https://docs.openstack.org/project-deploy-guide/openstack-ansible/latest/deploymenthost.html
2 | Prepare the target hosts | https://docs.openstack.org/project-deploy-guide/openstack-ansible/latest/targethosts.html
3 | Configure the deployment | https://docs.openstack.org/project-deploy-guide/openstack-ansible/latest/configure.html
4 | Run playbooks | https://docs.openstack.org/project-deploy-guide/openstack-ansible/latest/run-playbooks.html
5 | Verifying OpenStack operation | https://docs.openstack.org/project-deploy-guide/openstack-ansible/latest/verify-operation.html

**Base OS:** Ubuntu 22.04.4 LTS (Jammy Jellyfish)

Update all packages:
```bash
sudo apt update
sudo apt dist-upgrade
reboot
```

Setup openstack-ansible repo:
```bash
# Become root user
sudo -i

# clone openstack-ansible
git clone https://opendev.org/openstack/openstack-ansible \
  /opt/openstack-ansible
cd /opt/openstack-ansible

# take the latest stable release
git checkout 29.0.1
```
> use `master` branch for latest build.


bootstrap all in one setup:
```bash
./scripts/bootstrap-ansible.sh
./scripts/bootstrap-aio.sh
```

Update user config file:
```bash
vim /etc/openstack_deploy/openstack_user_config.yml
```

Update user variables:
```bash
vim /etc/openstack_deploy/user_variables.yml
```

Verify External IP for accessing horizon dashboard:
```
cat /etc/openstack_deploy/openstack_user_config.yml | grep external_lb_vip_address
```

Install everything, move to `/opt/openstack-ansible/playbooks` directory:
```bash
cd /opt/openstack-ansible/playbooks

openstack-ansible setup-hosts.yml
openstack-ansible setup-infrastructure.yml
openstack-ansible setup-openstack.yml

# OR
openstack-ansible setup-everything.yml
```

verify installation:
```bash
lxc-ls --fancy
```

Check all the VMs:
```bash
virsh list --all
```

login as `admin` user, password you can get:
```bash
cat /etc/openstack_deploy/user_secrets.yml | grep "keystone_auth_admin_password"
```

Login to horizon container:
```bash
lxc-attach aio1-horizon-container-63d9ffa3
```




### Create public network:

Name | Project | Provider Network Type | Physical Network | External Network
---|---|---|---|---
public | admin | Flat | physnet1 | ✔️ 

Interface | CIDR Range | First IP | Last IP | Gateway | DHCP
---|---|---|---|---|---
br-vlan | 172.29.248.0/22 | 172.29.248.0 | 172.29.251.255 | 172.29.248.1 | 172.29.249.110,172.29.249.200

### Create private network:

Name | Project | Provider Network Type | Segmentation ID | External Network
---|---|---|---|---
private | myproject | Geneve | 1 | ✖️

CIDR Range | Gateway
---|---
172.30.1.0/24 | 172.30.1.1

> Note: It's won't ask for Provider Network Type, Segmentation ID and External Network from a member.

Check config details:
```bash
vim /etc/openstack_deploy/openstack_user_config.yml
```

### Flavors

Flavor | VCPUs | Disk (in GB)	| RAM (in MB)
---|---|---|---
m1.nano | 1	| 1	| 128
m1.micro | 1	| 2	| 256
m1.tiny | 1	| 5	| 512
m1.small | 1 | 10	| 1024
m1.medium	| 2	| 20 | 2048
m1.large | 4 | 40	| 4096
m1.xlarge	| 8	| 80	| 8192
|||
k1.medium	| 2	| 50	| 4096
k1.large	| 4	| 100	| 8192


Add network route in macos:
```bash
sudo route -n add -net 172.29.248.0/22 192.168.1.64
```

Add network route in linux:
```bash
sudo ip route add 172.29.248.0/22 via 192.168.1.64
```

