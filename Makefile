.PHONY: help \
	install \
	install-configs \
	install-configs-git

help:
	@echo "Usage: make install"
	@echo
	@echo "    install  Install dotfiles"
	@echo

install: install-configs

install-configs: install-configs-git
	ln -sfn $(shell pwd) $(HOME)/.dotfiles

install-configs-git:
	ln -sfn $(shell pwd)/git/gitconfig $(HOME)/.gitconfig
