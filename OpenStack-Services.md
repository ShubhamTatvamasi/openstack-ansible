# OpenStack Services

To list all OpenStack services along with their associated port numbers, you can refer to the following commonly used services and their default ports:

### OpenStack Services and Default Ports:

| Service                   | Port Number | Protocol | Description                        |
|---------------------------|-------------|----------|------------------------------------|
| **Keystone (Identity Service)**  | 5000, 35357   | HTTP/HTTPS | Public and admin API endpoints    |
| **Glance (Image Service)**       | 9292        | HTTP/HTTPS | API endpoint for image operations |
| **Nova (Compute Service)**       | 8774        | HTTP/HTTPS | Compute API                        |
| Nova Metadata Service            | 8775        | HTTP/HTTPS | Metadata API                       |
| **Neutron (Networking Service)** | 9696        | HTTP/HTTPS | Network API                        |
| Neutron Metadata Service         | 8775        | HTTP/HTTPS | Provides metadata to instances    |
| **Cinder (Block Storage Service)**| 8776        | HTTP/HTTPS | Block storage API                 |
| **Horizon (Dashboard)**          | 80, 443     | HTTP/HTTPS | Web dashboard                     |
| **Swift (Object Storage Service)**| 8080        | HTTP/HTTPS | Object storage API                |
| **Heat (Orchestration Service)** | 8004        | HTTP/HTTPS | Orchestration API                 |
| **Ceilometer (Telemetry Service)**| 8777        | HTTP/HTTPS | Telemetry API                     |
| **Ironic (Bare Metal Service)**  | 6385        | HTTP/HTTPS | Bare metal provisioning API       |
| **Magnum (Container Service)**   | 9511        | HTTP/HTTPS | Container orchestration API       |
| **Barbican (Key Management)**    | 9311        | HTTP/HTTPS | Key management API                |
| **Murano (App Catalog Service)** | 8082        | HTTP/HTTPS | App catalog API                   |
| **Mistral (Workflow Service)**   | 8989        | HTTP/HTTPS | Workflow service API              |
| **Designate (DNS Service)**      | 9001        | HTTP/HTTPS | DNS service API                   |
| **Zaqar (Messaging Service)**    | 8888        | HTTP/HTTPS | Messaging API                     |
| **Trove (Database Service)**     | 8779        | HTTP/HTTPS | Database service API              |
| **Sahara (Data Processing)**     | 8386        | HTTP/HTTPS | Data processing API               |

These ports are the default ones used by OpenStack services, but in some deployments, they may be customized. To find the exact port numbers in your environment, you may need to check the configuration files or use network tools like `netstat` or `ss`.
