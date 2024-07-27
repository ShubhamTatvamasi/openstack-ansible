# openstack-ansible

Source Code: https://docs.openstack.org/openstack-ansible/2024.1/user/aio/quickstart.html

Step | Task | Link
---|---|---
1 | Prepare the deployment host | https://docs.openstack.org/project-deploy-guide/openstack-ansible/latest/deploymenthost.html
2 | Prepare the target hosts | https://docs.openstack.org/project-deploy-guide/openstack-ansible/latest/targethosts.html
3 | Configure the deployment | https://docs.openstack.org/project-deploy-guide/openstack-ansible/latest/configure.html
4 | Run playbooks | https://docs.openstack.org/project-deploy-guide/openstack-ansible/latest/run-playbooks.html
5 | Verifying OpenStack operation | https://docs.openstack.org/project-deploy-guide/openstack-ansible/latest/verify-operation.html


Ubuntu QCOW2 Image for Openstack \
https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img

Source: https://cloud-images.ubuntu.com/

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

update external IP
```bash
vim /etc/openstack_deploy/openstack_user_config.yml
# external_lb_vip_address: 192.168.5.13

# OR verify
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

Install each component separately:
```bash
cd /opt/openstack-ansible/playbooks
openstack-ansible os-keystone-install.yml
```

verify installation:
```bash
lxc-ls --fancy
```

login as `admin` user, password you can get:
```bash
cat /etc/openstack_deploy/user_secrets.yml | grep "keystone_auth_admin_password"
```

Login to horizon container:
```bash
lxc-attach aio1-horizon-container-63d9ffa3
```

Create a network from Admin panel:

Name | Project | Provider Network Type | Physical Network | External Network
---|---|---|---|---
Internet | admin | Flat | physnet1 | ✔️

Check config details:
```bash
vim /etc/openstack_deploy/openstack_user_config.yml
```
