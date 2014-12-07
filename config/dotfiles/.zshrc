#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# custom keymaps
for keymap in 'emacs' 'viins' 'vicmd'; 
do
    # Ctrl-A goes to the beginning of the line
    bindkey -M $keymap '^A' beginning-of-line
    # Ctrl-E goes to the end of the line
    bindkey -M $keymap '^E' end-of-line
    # Ctrl-K deletes from the cursor to the end of the line
    bindkey -M $keymap '^K' kill-line
    # [Ctrl-RightArrow] - move forward one word
    bindkey -M $keymap '^[[1;5C' forward-word
    # [Ctrl-LeftArrow] - move backward one word
    bindkey -M $keymap '^[[1;5D' backward-word
done

# aliases
alias pj='ps -ef | grep java | grep -v grep'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
