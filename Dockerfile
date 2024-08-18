FROM docker.io/openstackmagnum/heat-container-agent:wallaby-stable-1

RUN sed -i 's/publicURL/internalURL/g' /usr/local/lib/python3.9/site-packages/os_collect_config/heat.py
