# Magnus


```bash
vim /etc/openstack_deploy/conf.d/magnum.yml
```

```yaml
magnum-infra_containers:
  aio1:
    ip: 172.29.236.100
magnum-infra_hosts:
  aio1:
    ip: 172.29.236.100
```

Install Magnum:
```bash
cd /opt/openstack-ansible/playbooks
openstack-ansible os-magnum-install.yml
```
