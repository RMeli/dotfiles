.DEFAULT_GOAL := help

help:
	@echo "=== Install Dotfiles ==="
	@echo "vimrc:\n    install .vimrc"

bash:
	@echo "Soft link bash files"
	ln -s ${PWD}/.bash_profile ${HOME}/.bash_profile

condarc:
	@echo "Soft link .condarc"
	ln -s ${PWD}/.condarc ${HOME}/.condarc

vimrc:
	@echo "Soft link .vimrc"
	ln -s ${PWD}/.vimrc ${HOME}/.vimrc