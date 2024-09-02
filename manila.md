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
sudo mount -t nfs 10.254.0.11:/shares/share-500da7a0-6b3c-42a7-8f74-229618ec208a /mnt/nfs
```

Unmount nfs:
```bash
sudo umount /mnt/nfs
```

### Share Rules

Access Type | Access Level | Access To
---|---|---
ip | read-write | 172.30.1.206
