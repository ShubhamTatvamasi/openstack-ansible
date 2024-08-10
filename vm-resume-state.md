### Configure OpenStack Instances Autostart after reboot


```bash
vim /etc/openstack_deploy/user_variables.yml
```

Add below line under the `[DEFAULT]` section:
```
resume_guests_state_on_host_boot = True
```


Edit `nova.conf` file:
```bash
sudo vim /etc/nova/nova.conf
```


Restart `nova-compute` service:
```bash
sudo systemctl restart nova-compute
```
