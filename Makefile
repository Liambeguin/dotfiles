install:
	ansible-playbook --ask-become-pass local.yml

update-dotfiles:
	ansible-playbook --tags dotfiles local.yml
