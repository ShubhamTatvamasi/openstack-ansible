# Manila

Install NFS package:
```bash
sudo apt install nfs-common
```

Create a directory for nfs:
```bash
sudo mkdir /mnt/nfs
```

Mount nfs storage:
```bash
sudo mount -t nfs 10.254.0.22:/shares/share-43c64f3f-20fe-4bec-8ac7-2e30e081c604 /mnt/nfs
```

Unmount nfs:
```bash
sudo umount /mnt/nfs
```

### Share Rules

Access Type | Access Level | Access To
---|---|---
ip | read-write | 172.30.1.206


### Share Types

Name | Driver handles share servers | Public
---|---|---
Gold | True | ✔️

