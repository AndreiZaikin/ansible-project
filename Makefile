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
	ansible-playbook playbook.yml -i inventory.ini -t "packages-install"

setup-packages-check:
	ansible-playbook playbook.yml -i inventory.ini -t "packages-install" --check

remove-packages:
	ansible-playbook playbook.yml -i inventory.ini -t "packages-remove"

remove-packages-check:
	ansible-playbook playbook.yml -i inventory.ini -t "packages-remove" --check

setup-users:
	ansible-playbook playbook.yml -i inventory.ini -t "users-create"

setup-users-check:
	ansible-playbook playbook.yml -i inventory.ini -t "users-create" --check

remove-users:
	ansible-playbook playbook.yml -i inventory.ini -t "users-remove"

remove-users-check:
	ansible-playbook playbook.yml -i inventory.ini -t "users-remove" --check

user-check-tirion:
	ansible appservers -i inventory.ini -m command -a "id tirion"

nginx-setup:
	ansible-playbook nginx.yml -i inventory.ini