if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test (uname) = Darwin
    eval "$(/opt/homebrew/bin/brew shellenv)"
end

set editors helix hx nvim vim vi nano
for editor in $editors
    if type -q $editor
        set -x EDITOR $editor
        break
    end
end
set -x VISUAL $EDITOR
