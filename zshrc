ZSH_THEME="af-magic"

alias show_hidden="defaults write com.apple.finder AppleShowAllFiles YES && killall Finder"
alias hide_hidden="defaults write com.apple.finder AppleShowAllFiles NO && killall Finder"

#Mattia GitHub shortcut
alias add='git add .'
alias com='git commit -m'
alias gps='git push'
alias gpl='git pull'
alias sta='git status'
alias gck='git checkout'

export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. `brew --prefix`/etc/profile.d/z.sh

alias crypt='openssl enc -aes-256-cbc -e -in /Users/polipetta/Documents/Codici.xlsx -out ~/Desktop/codici.xlsx'
alias codici="openssl enc -aes-256-cbc -d -in /Users/polipetta/Documents/Codici -out ~/Desktop/codici.xlsx"
alias nocodici='openssl enc -aes-256-cbc -e -in ~/Desktop/Codici.xlsx -out ~/Documents/Codici'
alias decrypt='openssl enc -aes-256-cbc -d -in'

# TMUX
export TERM="xterm-256color"
alias tmls='tmux ls'
alias tmat='tmux attach -t'
alias tmn='tmux new-session -s'
alias tmclose='tmux detach' # detach the current session leaving it open
alias tmkill='tmux kill-session -t'

alias port='~/.vim/scripts/showOpenPorts.sh'

# Sync Notes
alias sync='cd ~/.vim/scripts; ./updateNotes.sh'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="/usr/local/opt/node@8/bin:$PATH"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

#vi in bash
set -o vi
