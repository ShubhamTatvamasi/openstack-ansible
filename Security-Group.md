# Security Group

Allow All

Direction | Ether Type | IP Protocol | Port Range | Remote IP Prefix
---|---|---|---|---
Egress | IPv4 | Any | Any | 0.0.0.0/0
Egress | IPv6 | Any | Any | ::/0
Ingress | IPv4 | Any | Any | 0.0.0.0/0 
Ingress | IPv6 | Any | Any | ::/0 

New Rule:

Rule | Direction | IP Protocol | Remote | CIDR
---|---|---|---|---
Other Protocol | Ingress | -1 | CIDR | 0.0.0.0/0
Other Protocol | Ingress | -1 | CIDR | ::/0
