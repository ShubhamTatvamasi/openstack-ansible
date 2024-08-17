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

Update `openstack_user_config.yml` and `user_variables.yml`:
```bash
vim /etc/openstack_deploy/openstack_user_config.yml
vim /etc/openstack_deploy/user_variables.yml
```

Move to playbooks:
```bash
cd playbooks
```

Deploy config changes:
```bash
openstack-ansible "${SCRIPTS_PATH}/upgrade-utilities/deploy-config-changes.yml"
```

Upgrade hosts:
```bash
openstack-ansible setup-hosts.yml --limit '!galera_all:!rabbitmq_all' -e package_state=latest
openstack-ansible setup-hosts.yml -e 'lxc_container_allow_restarts=false' --limit 'galera_all:rabbitmq_all'
```

Upgrade infrastructure:
```bash
openstack-ansible setup-infrastructure.yml -e 'galera_upgrade=true' -e 'rabbitmq_upgrade=true' -e package_state=latest
openstack-ansible "${SCRIPTS_PATH}/upgrade-utilities/galera-cluster-rolling-restart.yml"
```

Upgrade OpenStack:
```bash
openstack-ansible setup-openstack.yml -e package_state=latest
```

Upgrade Ceph:
```bash
openstack-ansible /etc/ansible/roles/ceph-ansible/infrastructure-playbooks/rolling_update.yml
```


