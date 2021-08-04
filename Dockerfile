FROM alpine

RUN apk add --no-cache bash build-base git python3-dev openssh-client openssh-keygen sudo py3-virtualenv iptables libffi-dev openssl-dev linux-headers coreutils curl

RUN git clone -b master https://git.openstack.org/openstack/openstack-ansible /opt/openstack-ansible

WORKDIR /opt/openstack-ansible

RUN /opt/openstack-ansible/scripts/bootstrap-ansible.sh

ENTRYPOINT ["bash"]
