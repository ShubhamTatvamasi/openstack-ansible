# Nova

### Configure OpenStack Instances Autostart after reboot

Edit `nova.conf` file:
```bash
vim /etc/nova/nova.conf
```

Add below line under the `[DEFAULT]` section:
```
# Compute
resume_guests_state_on_host_boot = True
```

Restart `nova-compute` service:
```bash
systemctl restart nova-compute
```
