# Ansible Web Application Deployment

This Ansible project automates the deployment of a Python web application to Ubuntu servers. It handles the complete setup including Python environment, web server (Nginx), and application server (Gunicorn).

## Project Structure

```
.
├── detailsapp/                  # Application directory
│   ├── details_nginx.conf      # Nginx configuration
│   ├── gunicorn.service        # Systemd service file
│   └── ...                     # Application files
├── playbooks/
│   ├── deploy.yml             # Main deployment playbook
│   └── vars/
│       └── vars.yml           # Variable definitions
└── hosts.ini                  # Inventory file
```

## Prerequisites

- Ansible installed on the control machine
- Target server running Ubuntu
- SSH access to the target server
- Python 3.x on the target server

## Configuration

1. Update `hosts.ini` with your server details:

```ini
[web]
192.168.1.100 ansible_user=your_ssh_user
```

2. Review and modify variables in `playbooks/vars/vars.yml` if needed:

- Application name
- User permissions
- Directory paths
- Package lists

## Deployment

Run the deployment playbook:

```bash
ansible-playbook -i hosts.ini playbooks/deploy.yml
```

The playbook will:

1. Install required system packages
2. Create Python virtual environment
3. Copy application files
4. Install Python dependencies
5. Configure Nginx
6. Set up Gunicorn service
7. Start and enable services

## Services

The deployment sets up two main services:

1. **Nginx** - Web server

   - Configuration: `/etc/nginx/sites-available/detailsapp`
   - Enabled site: `/etc/nginx/sites-enabled/detailsapp`

2. **Gunicorn** - Application server
   - Service file: `/etc/systemd/system/detailsapp.service`
   - Managed by systemd

## Directory Structure

- Application: `/var/www/detailsapp/`
- Virtual Environment: `/var/www/detailsapp/venv/`
- Logs: Systemd journal

## Management

Common service management commands:

```bash
# Check service status
sudo systemctl status detailsapp
sudo systemctl status nginx

# Restart services
sudo systemctl restart detailsapp
sudo systemctl restart nginx

# View logs
sudo journalctl -u detailsapp
sudo journalctl -u nginx
```

## Troubleshooting

1. Check service status:

```bash
sudo systemctl status detailsapp
sudo systemctl status nginx
```

2. View application logs:

```bash
sudo journalctl -u detailsapp -f
```

3. Check Nginx configuration:

```bash
sudo nginx -t
```

4. Verify file permissions:

```bash
ls -la /var/www/detailsapp/
```

## Author

Dmitri Donskoy
email: crooper22@gmail.com
