### Configure OpenStack Instances Autostart after reboot


```bash
vim /etc/openstack_deploy/user_variables.yml
```

```yaml
resume_guests_state_on_host_boot: true
```

Edit `nova.conf` file:
```bash
sudo vim /etc/nova/nova.conf
```

Add below line under the `[DEFAULT]` section:
```
resume_guests_state_on_host_boot = True
```


Restart `nova-compute` service:
```bash
sudo systemctl restart nova-compute
```
