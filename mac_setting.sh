#!/bin/bash

#chmod +x mac_setting.sh
#source mac_setting.sh; functionName

function test(){
	echo 'ciao'
}

function init(){
	xcode-select --install
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	sudo chown -R $(whoami) /usr/local
	echo 'init'
	echo 'dev'
	echo 'utility'
	echo 'personal'
	echo 'setup'
	echo 'jstest'
	echo 'setvim'
	echo 'brew cask list: '
	brew cask list
}

function dev(){
	echo 'dev'
	brew cask install google-chrome
	brew cask install google-drive
	brew cask install iterm2
	brew cask install java
	brew install mysql
	brew services start mysql
	brew cask install mysqlworkbench
	# brew install sqlite
	# brew install sqlitebrowser
	brew install python3
	brew install node
	brew install vim
	brew install tmux
	brew install redis
	brew install curl
	/curl -L https://get.rvm.io | bash -s stable
	brew cask install google-cloud-sdk
	sudo easy_install virtualenv
	npm install -g bower
	npm install -g grunt-cli
	brew cask install git
	brew cask install heroku-toolbelt
	brew cask list
	brew install the_silver_searcher
	pip install ipython
}

function utility(){
	echo 'utility'
	brew install unrar
	brew cask install dropbox
	# brew install nmap
	# brew install wget
	# brew cask install istat-menus
	brew cask install teamviewer
	brew cask install spotify
	brew cask install alfred
	brew cask install caffeine
	brew cask install flux
	brew install tree
	npm -g install instant-markdown-d
	# npm install -g http-server
	echo brew cask list
}

function personal(){
	echo 'personal'
	brew cask install skype
	brew cask install slack
	brew cask install vlc
	brew cask install utorrent
	brew cask install telegram
	brew cask install plex-home-theater
	brew cask list
}

function setup(){
	npm install -g jshint
	brew install zsh
	chsh -s /usr/local/bin/zsh
	curl -L http://install.ohmyz.sh | sh
	cd ~/.oh-my-zsh && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
	. `brew --prefix`/etc/profile.d/z.sh
	touch ~/.hushlogin
	git config --global user.name "Mattia46"
	git config --global user.email "mattia.assogna@gmail.com"
	git config --global core.autocrlf input
	git config --global core.safecrlf true
	cd ~/.vim/bundle && git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs
	cd ~/.vim/bundle && git clone https://github.com/vimwiki/vimwiki.git

}

function jstest(){
	sudo npm install -g webdriver-manager
	webdriver-manager update
	npm install -g grunt-cli
	npm install -g karma-cli
	npm install -g protractor
	npm install -g phantomjs-prebuild
	npm install -g http-server
}

function setvim(){
	git clone git@github.com:Mattia46/.vim.git
	ln -s ~/.vim/vimrc ~/.vimrc
	ln -s ~/.vim/zshrc ~/.zshrc
	ln -s ~/.vim/tmux.conf ~/.tmux.conf
	ln -s ~/.vim/vimwiki ~/vimwiki
	ln -s ~/.vim/.agignore ~/.agignore
	ln -s ~/.vim/.gitignore ~/.gitignore
	ln -s ~/.vim/.eslintrc ~/.eslintrc
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim+PluginInstall
	echo 'vim setted'
}

function reactplugin(){
	npm install -g eslint
	npm install -g babel-eslint
	npm install -g eslint-plugin-react
}
