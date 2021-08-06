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
git clone -b stable/wallaby https://github.com/openstack/openstack-ansible.git /opt/openstack-ansible
cd /opt/openstack-ansible
```

Install packages:
```bash
sudo apt install -y \
  bridge-utils debootstrap openssh-server \
  tcpdump vlan python3 build-essential git \
  python3-dev sudo chrony
```


bootstrap all in one setup:
```bash
./scripts/bootstrap-ansible.sh
./scripts/bootstrap-aio.sh
```

Install everything, move to `/opt/openstack-ansible/playbooks` directory:
```bash
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
