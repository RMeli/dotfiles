.DEFAULT_GOAL := help

help:
	@echo "=== Install Dotfiles ==="
	@echo "vimrc:\n    install .vimrc"

vimrc:
	@echo "Soft link .vimrc..."
	ln -s ${PWD}/.vimrc ${HOME}/.vimrc