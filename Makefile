.DEFAULT_GOAL := help

help:
	@echo "=== Install Dotfiles ==="
	@echo "bash:\n    install .bash_profile"
	@echo "vim:\n    install .vimrc"
	@echo "conda:\n    install .condarc"

bash:
	@echo "Soft link bash files"
	ln -sf ${PWD}/bash_profile ${HOME}/.bash_profile
	ln -sf ${PWD}/bash/aliases.sh ${HOME}/.aliases.sh
	ln -sf ${PWD}/bash/functions.sh ${HOME}/.functions.sh

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

nvim:
	@echo ">>> Soft link .config/nvim"
	ln -sf ${PWD}/config/nvim ${HOME}/.config/nvim
	@echo ">>> Install Packer"
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ${HOME}/.config/nvim/site/pack/packer/start/packer.nvim

module:
	ln -sf ${PWD}/modulerc ${HOME}/.modulerc
	ln -sf ${PWD}/modulefiles ${HOME}/.modulefiles

yabai:
	ln -sf ${PWD}/yabairc ${HOME}/.yabairc

skhd:
	mkdir -p ${HOME}/.config/skhd
	ln -sf ${PWD}/skhdrc ${HOME}/.config/skhd/skhdrc

spack:
	@echo "Installing Spack (RMeli/Spack)"
	sh installers/spack.sh
