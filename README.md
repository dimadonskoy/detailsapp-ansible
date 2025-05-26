# DevOps Environment Setup

This project automates the deployment of a DevOps environment using Vagrant and Ansible. It supports both ARM64 (Apple Silicon) and x86_64 architectures.

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
├── deploy.sh           # Deployment automation script
├── requirements.txt    # Python dependencies
├── playbooks/         # Ansible playbooks
│   └── deploy.yml     # Main deployment playbook
└── detailsapp/        # Application files
    ├── app.py         # Main application
    ├── requirements.txt
    └── supervisor.conf
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
   git clone <repository-url>
   cd <repository-name>
   ```

2. Install Python dependencies:

   ```bash
   pip install -r requirements.txt
   ```

3. Run the deployment script:
   ```bash
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

## Logging

Deployment logs are stored in `/var/log/detailsapp/detailsapp.log`

## Troubleshooting

1. **VM Network Issues**:

   - The VM uses a private network with IP `192.168.56.100`
   - If you experience network conflicts, check your VirtualBox network settings

2. **Provisioning Issues**:

   - Check the Ansible logs in `/var/log/detailsapp/detailsapp.log`
   - Verify that all required files are present in the project structure

3. **Architecture Detection**:
   - If you encounter issues with the wrong box being selected, verify your system architecture:
     ```bash
     uname -m
     ```

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Authors

- Dmitri Donskoy
- Yair
