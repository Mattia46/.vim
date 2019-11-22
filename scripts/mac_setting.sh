#!/bin/bash

#chmod +x mac_setting.sh
#source mac_setting.sh; functionName

function init(){
	xcode-select --install
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	sudo chown -R $(whoami) /usr/local
	brew cask list
}

function dev(){
	echo 'dev'
	brew install python3
        brew install docker
	brew install node
	brew install vim
	brew install tmux
        brew install pandoc
	brew install curl
	brew install zsh
	\curl -L https://get.rvm.io | bash -s stable
	sudo easy_install virtualenv
	brew install git
	brew install the_silver_searcher
	brew install reattach-to-user-namespace # for copy paste in tmux
	brew install unrar
	brew install tree
	npm i -g instant-markdown-d
        npm i -g @aws-amplify/cli
	npm i -g tldr # Alternative to man
}

function caskModules() {
	brew cask install telegram
	brew cask install iterm2
	brew cask install dropbox
	brew cask install spotify
	brew cask install alfred
	brew cask install caffeine
	brew cask install flux
	brew cask install google-chrome
}

function setZsh(){
	chsh -s /usr/local/bin/zsh
	curl -L http://install.ohmyz.sh | sh
	cd ~/.oh-my-zsh && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
	brew install z
	. `brew --prefix`/etc/profile.d/z.sh
	touch ~/.hushlogin
        touch ~/.z
}

function setGithub() {
	git config --global user.name "Mattia46"
	git config --global user.email "mattia.assogna@gmail.com"
	git config --global core.autocrlf input
	git config --global core.safecrlf true
        ssh-keygen -t rsa -b 4096 -C "mattia.assogna@gmail.com"
        eval "$(ssh-agent -s)"
        #add this to ~/.ssh/config => only MAC
            #Host *
              #AddKeysToAgent yes
              #UseKeychain yes
              #IdentityFile ~/.ssh/id_rsa
        ssh-add -K ~/.ssh/id_rsa
        pbcopy < ~/.ssh/id_rsa.pub
        #Paste it to github
        ssh -T git@github.com # test if works
}

function setvim(){
	git clone https://github.com:Mattia46/.vim.git ~/
	ln -s ~/.vim/vimrc ~/.vimrc
	ln -s ~/.vim/zshrc ~/.zshrc
	ln -s ~/.vim/tmux.conf ~/.tmux.conf
	ln -s ~/.vim/.agignore ~/.agignore
	ln -s ~/.vim/.gitignore ~/.gitignore
	ln -s ~/.vim/.eslintrc ~/.eslintrc
	cd ~/.vim/bundle && git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs
	cd ~/.vim/bundle && git clone https://github.com/vimwiki/vimwiki.git
	vim+PluginInstall
}

function extra() {
	# pip install ipython
	# brew cask install mysqlworkbench
	# brew install mysql
	# brew services start mysql
        # brew install mongodb
	# brew install sqlite
	# brew install sqlitebrowser
	# brew install redis
	# brew cask install utorrent
	# brew cask install plex-home-theater
	# brew cask install amethyst # windows manager
	# brew cask install skype
	# brew cask install slack
	# brew cask install vlc
        # npm install -g serverless
        echo 'extra'
}

