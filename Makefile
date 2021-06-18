.DEFAULT_GOAL := help

help:
	@echo "=== Install Dotfiles ==="
	@echo "bash:\n    install .bash_profile"
	@echo "vim:\n    install .vimrc"
	@echo "conda:\n    install .condarc"

bash:
	@echo "Soft link bash files"
	ln -s ${PWD}/bash_profile ${HOME}/.bash_profile

conda:
	@echo "Soft link .condarc"
	ln -s ${PWD}/condarc ${HOME}/.condarc

vim:
	@echo "Soft link .vimrc"
	ln -s ${PWD}/vimrc ${HOME}/.vimrc