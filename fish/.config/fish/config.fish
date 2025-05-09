if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval "$(/opt/homebrew/bin/brew shellenv)"

set editors hx nvim vim vi nano
for editor in $editors
    if type -q $editor
        set -x EDITOR $editor
        break
    end
end
set -x VISUAL $EDITOR
