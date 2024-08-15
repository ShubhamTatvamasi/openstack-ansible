# glance

Move to lxc containers directory:
```bash
cd /var/lib/lxc/
```

Search for 
```bash
find . -type f -name glance-cache.conf
```

Move to glance config directory:
```bash
cd ./aio1-glance-container-657fbfff/rootfs/openstack/venvs/glance-29.0.1/etc/glance/
```

Search for `image_cache_max_size` values in all files:
```bash
grep -r image_cache_max_size
```

Update `image_cache_max_size` value:
```bash
vim glance-cache.conf
vim glance-api.conf
```

```
image_cache_max_size = 1073741824000
```
