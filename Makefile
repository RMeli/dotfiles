.DEFAULT_GOAL := help

help:
	@echo "=== Install Dotfiles ==="
	@echo "bash:\n    install .bash_profile"
	@echo "vim:\n    install .vimrc"
	@echo "conda:\n    install .condarc"

bash:
	@echo "Soft link bash files"
	ln -sf ${PWD}/bash_profile ${HOME}/.bash_profile

conda:
	@echo "Soft link .condarc"
	ln -sf ${PWD}/condarc ${HOME}/.condarc

starship:
	@echo "Soft link starship.toml"
	mkdir -p ${HOME}/.config
	ln -sf ${PWD}/starship.toml ${HOME}/.config/starship.toml
	sh installers/starship.sh 

vim:
	@echo "Soft link .vimrc"
	ln -sf ${PWD}/vimrc ${HOME}/.vimrc

module:
	ln -sf ${PWD}/modulerc ${HOME}/.modulerc
	ln -sf ${PWD}/modulefiles ${HOME}/.modulefiles

yabai:
	ln -sf ${PWD}/yabairc ${HOME}/.yabairc