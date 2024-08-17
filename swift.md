# Swift

Get inside swift proxy container:
```bash
lxc-attach aio1-swift-proxy-container-27ca8854
```

Update `sshd_config` file: 
```bash
vim /etc/ssh/sshd_config
```
```
# Add this line
PermitRootLogin yes
```

Restart SSH server:
```bash
systemctl restart sshd
```

Change password:
```bash
passwd
```

Try to SSH into the container:
```bash
ssh root@172.29.239.147
```

Unmonnt swift drives:
```bash
umount /srv/swift1.img
umount /srv/swift2.img
umount /srv/swift3.img
```

Remove all the drives data:
```bash
cd /srv
rm -rf *
```


