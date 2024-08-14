# OpenStack Client

Install on Linux:
```bash
apt install python3-pip
pip install python-openstackclient
```

Install on macOS:
```bash
brew install openstackclient
```


```bash
source admin-openrc.sh
```

Set this for insecure access:
```bash
alias openstack='openstack --insecure'
```

Check all the available images:
```
openstack image list
```

Update `.bashrc`:
```bash
vim ~/.bashrc
```
```
source /home/ubuntu/.openstack/admin-openrc.sh
```
