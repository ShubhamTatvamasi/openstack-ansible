# Magnum

https://docs.openstack.org/magnum/latest/user/index.html

https://docs.openstack.org/magnum/latest/configuration/sample-config.html

Install Magnum:
```bash
cd /opt/openstack-ansible/playbooks
openstack-ansible os-magnum-install.yml
```

Add Metadata in Image:

Common Operating System Properties -> OS Distro

COE | os_distro
---|---
Kubernetes | fedora-coreos

### Add CA Certificate to Magnum

Search for the `magnum.conf` location:
```bash
cd /var/lib/lxc/
find . -type f -name magnum.conf
```

Move to magnum config directory:
```bash
cd ./aio1-magnum-container-6f191f80/rootfs/etc/magnum/
```

Open `magnum.conf`:
```bash
vim magnum.conf
```

Update the `[drivers]` section:
```
[drivers]
verify_ca = False
openstack_ca_file = /etc/magnum/openstack_ca_file.crt
```

Copy the OpenStack CA file to magnum config directory:
```bash
cat /etc/haproxy/ssl/haproxy_aio1-192.168.1.64.pem > openstack_ca_file.crt
```

Look for magnum container:
```bash
lxc-ls --fancy
```

Restart magnum container:
```bash
lxc-stop aio1-magnum-container-6f191f80
lxc-start aio1-magnum-container-6f191f80
```

