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

Backup current state:
```bash
source_series_backup_file="/openstack/backup-openstack-ansible-2024.1.tar.gz"
tar zcf ${source_series_backup_file} /etc/openstack_deploy /etc/ansible/ /usr/local/bin/openstack-ansible.rc
```

Bootstrap again:
```bash
${SCRIPTS_PATH}/bootstrap-ansible.sh
${SCRIPTS_PATH}/bootstrap-aio.sh
```

Move to playbooks:
```bash
cd playbooks
```


