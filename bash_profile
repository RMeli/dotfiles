source ${HOME}/.aliases.sh
source ${HOME}/.functions.sh

# Increase macOS open files limit
ulimit -n 4096

. "$HOME/.local/bin/env"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/Users/romeli/.juliaup/bin:*)
        ;;

    *)
        export PATH=/Users/romeli/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<
