.PHONY: help \
	install \
	install-configs \
	install-configs-git \
	install-configs-bash

help:
	@echo "Usage: make install"
	@echo
	@echo "    install  Install dotfiles"
	@echo

install: install-configs

install-configs: install-configs-git install-configs-bash
	ln -sfn $(shell pwd) $(HOME)/.dotfiles

install-configs-git:
	ln -sfn $(shell pwd)/git/gitconfig $(HOME)/.gitconfig

install-configs-bash:
	ln -sfn $(shell pwd)/bash/bash_profile $(HOME)/.bash_profile

