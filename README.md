# openstack-ansible

Source Code: https://github.com/openstack/openstack-ansible

Step | Task | Link
---|---|---
1 | Prepare the deployment host | https://docs.openstack.org/project-deploy-guide/openstack-ansible/latest/deploymenthost.html
2 | Prepare the target hosts | https://docs.openstack.org/project-deploy-guide/openstack-ansible/latest/targethosts.html
3 | Configure the deployment | https://docs.openstack.org/project-deploy-guide/openstack-ansible/latest/configure.html
4 | Run playbooks | https://docs.openstack.org/project-deploy-guide/openstack-ansible/latest/run-playbooks.html
5 | Verifying OpenStack operation | https://docs.openstack.org/project-deploy-guide/openstack-ansible/latest/verify-operation.html


Ubuntu QCOW2 Image for Openstack \
https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img

Source: https://cloud-images.ubuntu.com/

clone openstack:
```bash
sudo su
git clone -b stable/xena https://github.com/openstack/openstack-ansible.git /opt/openstack-ansible
cd /opt/openstack-ansible
```
> use `master` branch for latest build.

Install packages:
```bash
sudo apt update
sudo apt install -y \
  bridge-utils debootstrap openssh-server \
  tcpdump vlan python3 build-essential git \
  python3-dev sudo chrony
```

Install kernel extra packages:
```bash
sudo apt install -y \
  linux-modules-extra-$(uname -r)
```

bootstrap all in one setup:
```bash
./scripts/bootstrap-ansible.sh
./scripts/bootstrap-aio.sh
```

update external IP
```bash
vim /etc/openstack_deploy/openstack_user_config.yml
# external_lb_vip_address: 192.168.5.13
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

login as `admin` user, password you can get:
```bash
cat /etc/openstack_deploy/user_secrets.yml | grep "keystone_auth_admin_password"
```
