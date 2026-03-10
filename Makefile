ping:
	ansible all -i inventory.ini -u andrei -m ping
git-install:
	ansible-playbook git-install.yml -i inventory.ini
git-remove:
	ansible-playbook git-remove.yml -i inventory.ini
git-check:
	ansible webservers -i inventory.ini -m command -a "git --version"
