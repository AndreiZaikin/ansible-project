# Ansible project

Inventory file for managing remote server.

## Usage

- `make ping` - test connection to server
- `make git-install` - install git on webservers
- `make git-remove` - remove git from webservers  
- `make git-check` - check git version on webservers

## Files

- `inventory.ini` - server IP address and groups
- `git-install.yml` - playbook for git installation
- `git-remove.yml` - playbook for git removal  
- `Makefile` - convenience commands
