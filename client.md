# OpenStack Client

Install on Linux:
```bash
apt install pipx
pipx install python-openstackclient
pipx install python-manilaclient
pipx install python-novaclient
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

Remove protection from image:
```bash
openstack image set --unprotected 437e89a4-8f42-4354-ab53-6e0ef640e2e8
```

Update `.bashrc`:
```bash
vim ~/.bashrc
```
```
source /home/ubuntu/.openstack/admin-openrc.sh
export PATH="$HOME/.local/bin:$PATH"
```
