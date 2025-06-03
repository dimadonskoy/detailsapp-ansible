# 🚀 Webapp (Details-app) deployment project

[![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Nginx](https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white)](https://www.nginx.com/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)](https://ubuntu.com/)
[![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![Vagrant](https://img.shields.io/badge/Vagrant-1868F2?style=for-the-badge&logo=vagrant&logoColor=white)](https://www.vagrantup.com/)
[![VirtualBox](https://img.shields.io/badge/VirtualBox-183A61?style=for-the-badge&logo=virtualbox&logoColor=white)](https://www.virtualbox.org/)
[![Ansible](https://img.shields.io/badge/Ansible-000000?style=for-the-badge&logo=ansible&logoColor=white)](https://www.ansible.com/)

This project automates the deployment of a web app using Vagrant and Ansible. It supports both ARM64 (Apple Silicon) and x86_64 architectures.

## Prerequisites

- [Vagrant](https://www.vagrantup.com/downloads)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [Python 3](https://www.python.org/downloads/)
- [pip](https://pip.pypa.io/en/stable/installation/)

## Project Structure

```
.
├── Vagrantfile          # VM configuration with architecture detection
├── hosts.ini           # Ansible inventory file
├── ansible.cfg         # Ansible configuration file
├── deploy.sh           # Deployment automation script
├── LICENSE.md          # Project license file
├── playbooks/          # Ansible playbooks
│   ├── deploy.yml      # Main deployment playbook
│   └── vars/vars.yml   # Ansible variables
└── detailsapp/         # Application files
    ├── src/            # Source code directory
    ├── details.py      # Main application
    ├── details_nginx.conf  # Nginx configuration for the app
    ├── gunicorn.service    # Systemd service file
    ├── gunicorn_conf.py    # Gunicorn configuration
    └── requirements.txt    # Python dependencies
```

## Features

- **Automatic Architecture Detection**: Automatically selects the appropriate Ubuntu box based on your system's architecture (ARM64 for Apple Silicon, x86_64 for Intel)
- **Automated Deployment**: Single command deployment using `deploy.sh`
- **Infrastructure as Code**: VM configuration managed through Vagrant
- **Configuration Management**: System configuration managed through Ansible
- **Logging**: Comprehensive logging of deployment process

## Installation

1. Clone the repository:

   ```bash
   git clone git@github.com:dimadonskoy/detailsapp-ansible.git
   cd detailsapp-ansible
   ```

2. Run the deployment script:
   ```bash
   sudo chmod +x deploy.sh
   sudo ./deploy.sh
   ```

## Architecture Support

The system automatically detects your CPU architecture and uses the appropriate Ubuntu box:

- ARM64 (Apple Silicon): Uses `net9/ubuntu-24.04-arm64`
- x86_64 (Intel): Uses `net9/ubuntu-24.04`

## Deployment Process

The deployment script (`deploy.sh`) performs the following steps:

1. Checks for required dependencies (Vagrant, VirtualBox, Ansible)
2. Creates necessary log directories
3. Detects VM status and runs appropriate Vagrant commands:
   - For new VMs: `vagrant up` (includes initial provisioning)
   - For existing VMs: `vagrant provision`

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Authors

- Dmitri Donskoy
- Yair Kochavi
