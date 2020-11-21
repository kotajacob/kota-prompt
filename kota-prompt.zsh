# Kota's zsh prompt

# Prompt is path, shortened with ~ and turns red on an error exit code.
# Additionally it turns blue when in normal mode.
# Plugin sets vi-mode if not already set.

# To use you must set PROMPT='$(vi_mode_status)'

# updates editor information when the keymap changes
function zle-keymap-select() {
    # update keymap variable for the prompt
    VI_KEYMAP=$KEYMAP
    zle reset-prompt
}

# start every prompt in insert mode
function zle-line-init() {
    zle -K viins
}

zle -N zle-line-init
zle -N zle-keymap-select

# enable vi keymap (just in case lol)
bindkey -v

# reduce esc delay
export KEYTIMEOUT=1

# prompt variables
: "${VI_NORMAL_MODE_INDICATOR="%F{blue}%~ %f"}"
: "${VI_INSERT_MODE_INDICATOR="%(?..%F{red})%~ %f"}"

# enable prompt substition
setopt PROMPT_SUBST

# set the prompt
function vi_mode_status() {
    if [[ "$VI_KEYMAP" == "vicmd" ]]; then
        echo "$VI_NORMAL_MODE_INDICATOR"
    else
        echo "$VI_INSERT_MODE_INDICATOR"
    fi
}
