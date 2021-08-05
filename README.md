# openstack-ansible

Source Code: https://github.com/openstack/openstack-ansible

Step | Task | Link
---|---|---
1 | Prepare the deployment host | https://docs.openstack.org/project-deploy-guide/openstack-ansible/latest/deploymenthost.html
2 | Prepare the target hosts | https://docs.openstack.org/project-deploy-guide/openstack-ansible/latest/targethosts.html
3 | Configure the deployment | https://docs.openstack.org/project-deploy-guide/openstack-ansible/latest/configure.html
4 | Run playbooks | https://docs.openstack.org/project-deploy-guide/openstack-ansible/latest/run-playbooks.html
5 | Verifying OpenStack operation | https://docs.openstack.org/project-deploy-guide/openstack-ansible/latest/verify-operation.html

bootstrap all in one setup:
```bash
./scripts/bootstrap-aio.sh
```

Install everything, move to `/opt/openstack-ansible/playbooks` directory:
```bash
openstack-ansible setup-everything.yml
```

