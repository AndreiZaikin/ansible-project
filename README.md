# Ansible project

Ansible configuration for managing remote servers.

## Usage

### Connection
- `make ping` - test connection to server

### Git operations
- `make git-install` - install git on webservers
- `make git-remove` - remove git from webservers
- `make git-check` - check git version on webservers

### Full setup
- `make setup` - run complete playbook (packages + users)
- `make setup-check` - dry run of complete playbook

### Packages management
- `make setup-packages` - install packages (git, make, nodejs)
- `make setup-packages-check` - dry run for package installation
- `make remove-packages` - remove packages
- `make remove-packages-check` - dry run for package removal

### Users management
- `make setup-users` - create users (arya, sansa, tirion)
- `make setup-users-check` - dry run for user creation
- `make remove-users` - remove users
- `make remove-users-check` - dry run for user removal
- `make user-check-tirion` - check if user tirion exists

## Files

- `inventory.ini` - server IP address and groups
- `playbook.yml` - main playbook for server setup
- `git-install.yml` - playbook for git installation
- `git-remove.yml` - playbook for git removal
- `Makefile` - convenience commands with dry-run options