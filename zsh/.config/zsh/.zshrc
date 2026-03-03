setopt nomatch notify
unsetopt autocd beep extendedglob
bindkey -e

alias l='ls -lah'
alias v="$VISUAL"
alias gss="git status -s"
alias gs="git status"

if type brew &>/dev/null
then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

autoload -Uz compinit; compinit
