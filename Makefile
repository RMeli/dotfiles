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

starship:
	@echo "Soft link starship.toml"
	mkdir -p ${HOME}/.config
	ln -s ${PWD}/starship.toml ${HOME}/.config/starship.toml

vim:
	@echo "Soft link .vimrc"
	ln -s ${PWD}/vimrc ${HOME}/.vimrc

module:
	ln -s ${PWD}/modulerc ${HOME}/.modulerc
	ln -s ${PWD}/modulefiles ${HOME}/.modulefiles