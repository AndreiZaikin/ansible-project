ping:
	ansible all -i inventory.ini -u andrei -m ping

git-install:
	ansible-playbook git-install.yml -i inventory.ini

git-install-no-facts:
	ansible-playbook git-install.yml -i inventory.ini -e "do_gather_facts=false"

git-install-benchmark:
	@echo "Running benchmark..."
	@echo "With facts gathering..."
	@/usr/bin/time -f "%e" -o /tmp/time_facts.txt sh -c "ansible-playbook git-install.yml -i inventory.ini > /dev/null 2>&1"
	@ansible-playbook git-remove.yml -i inventory.ini > /dev/null 2>&1
	@echo "Without facts gathering..."
	@/usr/bin/time -f "%e" -o /tmp/time_no_facts.txt sh -c "ansible-playbook git-install.yml -i inventory.ini -e 'do_gather_facts=false' > /dev/null 2>&1"
	@ansible-playbook git-remove.yml -i inventory.ini > /dev/null 2>&1
	@echo "\n=== Results ==="
	@printf "| %-27s | %-13s |\n" "Configuration" "Time (seconds)"
	@printf "|-----------------------------|----------------|\n"
	@printf "| %-27s | %-14s |\n" "With facts gathering" "$$(cat /tmp/time_facts.txt)"
	@printf "| %-27s | %-14s |\n" "Without facts gathering" "$$(cat /tmp/time_no_facts.txt)"
	@printf "|-----------------------------|----------------|\n"
	@rm -f /tmp/time_facts.txt /tmp/time_no_facts.txt

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