.DEFAULT_GOAL := help

bashshell:
	@echo "Soft link bash files"
	ln -sf ${PWD}/bash_profile ${HOME}/.bash_profile
	ln -sf ${PWD}/bash/aliases.sh ${HOME}/.aliases.sh
	ln -sf ${PWD}/bash/functions.sh ${HOME}/.functions.sh

conda:
	ln -sf ${PWD}/condarc ${HOME}/.condarc

starship:
	@echo "Soft link starship.toml"
	mkdir -p ${HOME}/.config
	ln -sf ${PWD}/starship.toml ${XDG_CONFIG_HOME}/starship.toml

nvim:
	@echo ">>> Soft link .config/nvim"
	ln -sf ${PWD}/config/nvim ${XDG_CONFIG_HOME}/nvim

zed:
	@echo ">>> Soft link .config/zed/settings.json"
	mkdir -p ${XDG_CONFIG_HOME}/zed
	ln -sf ${PWD}/config/zed/settings.json ${XDG_CONFIG_HOME}/zed/settings.json

module:
	ln -sf ${PWD}/modulerc ${HOME}/.modulerc
	ln -sf ${PWD}/modulefiles ${HOME}/.modulefiles

tmux:
	mkdir -p ${XDG_CONFIG_HOME}/tmux
	ln -sf ${PWD}/tmux.conf ${XDG_CONFIG_HOME}/tmux/tmux.conf
	git clone --depth 1 https://github.com/tmux-plugins/tpm ${XDG_CONFIG_HOME}/tmux/plugins/tpm
