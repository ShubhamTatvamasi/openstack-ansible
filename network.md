# Network

### Create public network:

Name | Project | Provider Network Type | Physical Network | External Network
---|---|---|---|---
public | admin | Flat | physnet1 | ✔️ 

Interface | CIDR Range | First IP | Last IP | Gateway | DHCP
---|---|---|---|---|---
br-vlan | 172.29.248.0/22 | 172.29.248.0 | 172.29.251.255 | 172.29.248.1 | 172.29.249.110,172.29.249.200

### Create private network:

Name | Project | Provider Network Type | Segmentation ID | External Network
---|---|---|---|---
private | myproject | Geneve | 1 | ✖️

CIDR Range | Gateway
---|---
172.30.1.0/24 | 172.30.1.1

> Note: It's won't ask for Provider Network Type, Segmentation ID and External Network from a member.

### Setup routing in client system

Add network route in macos:
```bash
sudo route -n add -net 172.29.248.0/22 192.168.1.64
```

Add network route in linux:
```bash
sudo ip route add 172.29.248.0/22 via 192.168.1.64
```
