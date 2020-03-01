.PHONY: help install install-configs install-config-git install-config-shell install-config-vim

help:
	@echo "usage: make [option]"
	@echo
	@echo "options:"
	@echo "  install		Install all dotfiles"
	@echo "  install-configs	Install all configs dotfiles"
	@echo "  install-config-git 	Install git config dotfiles only"
	@echo "  install-config-shell	Install shell config dotfiles only"
	@echo "  install-config-vim   	Install vim config dotfiles only"
	@echo

install: install-configs

install-configs: install-config-git install-config-shell install-config-vim
	ln -sfn $(shell pwd) $(HOME)/.dotfiles

install-config-git:
	ln -sfn $(shell pwd)/git/gitconfig $(HOME)/.gitconfig

install-config-shell:
	ln -sfn $(shell pwd)/shell/bash_profile $(HOME)/.bash_profile
	ln -sfn $(shell pwd)/shell/aliases/aliases $(HOME)/.bash_aliases
	ln -sfn $(shell pwd)/shell/functions/functions $(HOME)/.bash_functions

install-config-vim:
	ln -sfn $(shell pwd)/vim/vimrc $(HOME)/.vimrc
