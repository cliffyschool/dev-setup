
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
alias ds='cd ~/dev/dev-setup'
alias dellsux='~/dev/dev-setup/config/hardware/disableStupidDellTouchpad.sh'
alias proxy='export http_proxy=http://www-proxy.us.oracle.com:80;export HTTPS_PROXY=$http_proxy;export HTTP_PROXY=$http_proxy;export FTP_PROXY=$http_proxy;export https_proxy=$http_proxy;export ftp_proxy=$http_proxy;'
alias noproxy='unset http_proxy;unset HTTPS_PROXY;unset HTTP_PROXY;unset FTP_PROXY;unset https_proxy;unset ftp_proxy'
alias gdd='git difftool develop --no-prompt'
alias j6='sudo update-java-alternatives -s java-6-oracle'
alias j8='sudo update-java-alternatives -s java-8-oracle'

rdp() { rdesktop -d oradev -u cbfreema -p - -k en-us -a 16 -z -g 1366x768 -5 -P $1 }

# prepend a space to the beginning of all .java files modified int the most recent x commits
# This makes it easy to find files to reformat in IntelliJ
touchRecent() {git diff --name-only HEAD~$1 | grep java | xargs sed -i '1s;^; ;'}
