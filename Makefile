ping:
	ansible all -i inventory.ini -u andrei -m ping

git-install:
	ansible-playbook git-install.yml -i inventory.ini

git-remove:
	ansible-playbook git-remove.yml -i inventory.ini

git-check:
	ansible webservers -i inventory.ini -m command -a "git --version"

setup:
	ansible-playbook playbook.yml -i inventory.ini

setup-check:
	ansible-playbook playbook.yml -i inventory.ini --check

setup-packages:
	ansible-playbook playbook.yml -i inventory.ini --tags "packages-install"

setup-packages-check:
	ansible-playbook playbook.yml -i inventory.ini --tags "packages-install" --check

remove-packages:
	ansible-playbook playbook.yml -i inventory.ini --tags "packages-remove"

remove-packages-check:
	ansible-playbook playbook.yml -i inventory.ini --tags "packages-remove" --check

setup-users:
	ansible-playbook playbook.yml -i inventory.ini --tags "users-create"

setup-users-check:
	ansible-playbook playbook.yml -i inventory.ini --tags "users-create" --check

remove-users:
	ansible-playbook playbook.yml -i inventory.ini --tags "users-remove"

remove-users-check:
	ansible-playbook playbook.yml -i inventory.ini --tags "users-remove" --check

user-check-tirion:
	ansible appservers -i inventory.ini -m command -a "id tirion"