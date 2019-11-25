.PHONY: help \
	install \
	install-configs \
	install-configs-git \
	install-configs-bash

help:
	@echo "Usage: make [option]"
	@echo
	@echo "Options:"
	@echo "  install		Install all dotfiles"
	@echo "  install-configs	Install all configs dotfiles"
	@echo "  install-configs-git 	Install git config dotfiles only"
	@echo "  install-configs-bash	Install bash config dotfiles only"
	@echo

install: install-configs

install-configs: install-configs-git install-configs-bash

install-configs-git:
	ln -sfn $(shell pwd)/git/gitconfig $(HOME)/.gitconfig
	ln -sfn $(shell pwd)/git/gitignote $(HOME)/.gitignore

install-configs-bash:
	ln -sfn $(shell pwd)/bash/bash_profile $(HOME)/.profile

