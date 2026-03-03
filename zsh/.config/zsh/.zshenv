CARGO_PATH="$HOME/.cargo"
if [ -d $CARGO_PATH ]; then
    path+=("$CARGO_PATH/bin")
    export PATH
    . "$CARGO_PATH/env"
fi

BREW_EXECUTABLE="/opt/homebrew/bin/brew"
if [ -f $BREW_EXECUTABLE ]; then
    eval "$($BREW_EXECUTABLE shellenv)"
fi

editors=('helix' 'hx' 'nvim' 'vim')
EDITOR='vi'
for editor in "${editors[@]}"; do
    if (( $+commands["$editor"] )); then
        EDITOR="$editor"
        break
    fi
done
VISUAL="$EDITOR"
export EDITOR VISUAL

GOPATH="$HOME/.local/gopath"
export GOPATH

path+=("$HOME/.local/bin")
