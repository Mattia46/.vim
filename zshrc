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

#run Python server plus migrations:
alias runserver='./manage.py runserver 0.0.0.0:8000'
alias migrateserver='./manage.py makemigrations ; ./manage.py migrate ; ./manage.py runserver 0.0.0.0:8000'
alias pipmigrateserver='pip install -R requirements/common.txt ; ./manage.py makemigrations ; ./manage.py migrate ; ./manage.py runserver 0.0.0.0:8000'
alias ws3='source ~/Development/envs/ws3/bin/activate'
alias ws4='source ~/ws3/bin/activate'

export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. ~/z.sh

alias crypt='openssl enc -aes-256-cbc -e -in /Users/polipetta/Documents/Codici.xlsx -out ~/Desktop/codici.xlsx'
alias codici="openssl enc -aes-256-cbc -d -in /Users/polipetta/Documents/Codici -out ~/Desktop/codici.xlsx"
alias nocodici='openssl enc -aes-256-cbc -e -in ~/Desktop/Codici.xlsx -out ~/Documents/Codici'
alias decrypt='openssl enc -aes-256-cbc -d -in'

# TMUX
alias tmls='tmux ls'
alias tmat='tmux attach -t'
alias tmn='tmux new-session -s'
alias tmclose='tmux detach' # detach the current session leaving it open
alias tmkill='tmux kill-session -t'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
git_next() {
    BRANCH=`git show-ref | grep $(git show-ref -s -- HEAD) | sed 's|.*/\(.*\)|\1|' | grep -v HEAD | sort | uniq`
    HASH=`git rev-parse $BRANCH`
    PREV=`git rev-list --topo-order HEAD..$HASH | tail -1`
    git checkout $PREV
}
