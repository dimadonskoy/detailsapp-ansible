#!/usr/bin/env bash

#######################################################################     

#Developed by : Dmitri Donskoy
#Purpose : Automates the deployment of the Detailsapp using Ansible for configuration management and Vagrant for virtual machine provisioning.
#Update date : 24.05.2025
#Version : 0.0.1
# set -x
set -o errexit
set -o nounset
set -o pipefail


############################ GLOBAL VARS ##############################

# Check if user is root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

# Create LOGS directory if  not exist
if [ ! -d "/var/log/detailsapp" ]; then
    echo "logs directory does not exist. Creating logs directory..."
    mkdir -p /var/log/detailsapp
fi

LOGFILE=/var/log/detailsapp/detailsapp.log


if ! command -v ansible &> /dev/null; then
    echo "Ansible is not installed , please install it first."  | tee -a "$LOGFILE"
    exit 1
fi

if ! command -v vagrant &> /dev/null; then
    echo "Vagrant is not installed , please install it first." | tee -a "$LOGFILE"
    exit 1
fi
if ! command -v virtualbox &> /dev/null; then
    echo "VirtualBox is not installed , please install it first."   | tee -a "$LOGFILE"
    exit 1
fi

# Start Vagrant and provision

if [[ ! -f "Vagrantfile" ]]; then
    echo "Vagrantfile not found in the current directory. Please ensure it exists." | tee -a "$LOGFILE"
    exit 1
fi

vagrant up && vagrant provision | tee -a "$LOGFILE"
