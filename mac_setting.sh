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
	brew cask install iterm2
	#brew install mysql
	#brew services start mysql
	#brew cask install mysqlworkbench
        #brew install mongodb
	# brew install sqlite
	# brew install sqlitebrowser
	brew install python3
        brew install docker
	brew install node
	brew install vim
	brew install tmux
        brew install pandoc
	#brew install redis
	brew install curl
	\curl -L https://get.rvm.io | bash -s stable
	sudo easy_install virtualenv
	brew install git
	brew install the_silver_searcher
	pip install ipython
}

function utility(){
	echo 'utility'
	brew install unrar
	brew cask install dropbox
	brew cask install spotify
	brew cask install alfred
	brew cask install caffeine
	brew cask install flux
	brew install tree
	npm -g install instant-markdown-d
	echo brew cask list
}

function personal(){
	echo 'personal'
	brew cask install skype
	brew cask install slack
	brew cask install vlc
	#brew cask install utorrent
	brew cask install telegram
	#brew cask install plex-home-theater
	#brew cask install amethyst # windows manager
	brew install reattach-to-user-namespace # for copy paste in tmux
	brew cask list
}

function setup(){
        npm install -g serverless
	brew install zsh
	chsh -s /usr/local/bin/zsh
	curl -L http://install.ohmyz.sh | sh
	cd ~/.oh-my-zsh && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
	brew install z
	. `brew --prefix`/etc/profile.d/z.sh
	touch ~/.hushlogin
        touch ~/.z
	git config --global user.name "Mattia46"
	git config --global user.email "mattia.assogna@gmail.com"
	git config --global core.autocrlf input
	git config --global core.safecrlf true
	cd ~/.vim/bundle && git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs
	cd ~/.vim/bundle && git clone https://github.com/vimwiki/vimwiki.git

}

function setvim(){
	git clone https://ithub.com:Mattia46/.vim.git ~/
	ln -s ~/.vim/vimrc ~/.vimrc
	ln -s ~/.vim/zshrc ~/.zshrc
	ln -s ~/.vim/tmux.conf ~/.tmux.conf
	ln -s ~/.vim/vimwiki ~/vimwiki
	ln -s ~/.vim/.agignore ~/.agignore
	ln -s ~/.vim/.gitignore ~/.gitignore
	ln -s ~/.vim/.eslintrc ~/.eslintrc
	vim+PluginInstall
	echo 'vim setted'
}

function reactplugin(){
	npm install -g eslint
	npm install -g babel-eslint
	npm install -g eslint-plugin-react
}
