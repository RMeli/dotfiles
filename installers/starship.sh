#!/bin/sh

# TODO: Non-interactive execution needed
#sh -c "$(curl -fsSL https://starship.rs/install.sh)"

grep 'eval "$(starship init zsh)"' ~/.zshrc > /dev/null || echo 'eval "$(starship init zsh)"' >> ~/.zshrc
grep 'eval "$(starship init bash)"' ~/.bashrc > /dev/null || echo 'eval "$(starship init bash)"' >> ~/.bashrc
