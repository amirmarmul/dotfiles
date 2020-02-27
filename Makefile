.PHONY: help \
	install \
	install-configs \
	install-configs-git \
	install-configs-bash \
	install-configs-vim 

help:
	@echo "Usage: make [option]"
	@echo
	@echo "Options:"
	@echo "  install		Install all dotfiles"
	@echo "  install-configs	Install all configs dotfiles"
	@echo "  install-configs-git 	Install git config dotfiles only"
	@echo "  install-configs-bash	Install bash config dotfiles only"
	@echo "  install-configs-vim   Install vim config dotfiles only"
	@echo

install: install-configs

install-configs: install-configs-git install-configs-bash install-configs-vim

install-configs-git:
	ln -sfn $(shell pwd)/git/gitconfig $(HOME)/.gitconfig
	ln -sfn $(shell pwd)/git/gitignore $(HOME)/.gitignore

install-configs-bash:
	ln -sfn $(shell pwd)/bash/bash_profile $(HOME)/.profile

install-configs-vim:
	ln -sfn $(shell pwd)/vim/vimrc $(HOME)/.vimrc
