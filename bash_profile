source ${HOME}/.aliases.sh
source ${HOME}/.functions.sh

# Increase macOS open files limit
ulimit -n 4096

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/romeli/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/romeli/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/romeli/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/romeli/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/romeli/miniconda3/etc/profile.d/mamba.sh" ]; then
    . "/Users/romeli/miniconda3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

