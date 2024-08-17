# Upgrade

Source: https://docs.openstack.org/openstack-ansible/latest/admin/upgrades/major-upgrades.html



Move to `openstack-ansible` directory:
```bash
sudo -i
cd /opt/openstack-ansible
```

Pull the latest code and switch the tag:
```bash
git pull
git checkout 29.0.2
```

Set variables:
```bash
export MAIN_PATH="$(pwd)"
export SCRIPTS_PATH="${MAIN_PATH}/scripts"
```


