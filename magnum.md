# Magnum

https://docs.openstack.org/magnum/latest/user/index.html

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


https://www.fedoraproject.org/coreos/download?stream=stable#arches


Restart magnum container:
```bash
lxc-stop aio1-magnum-container-6f191f80
lxc-start aio1-magnum-container-6f191f80
```

