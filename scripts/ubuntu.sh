#!/bin/bash

#Install Dropbox first

sudo chown -R $(whoami) /usr/local

#node & npm
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential

#zsh
sudo apt install zsh
chsh -s $(which zsh)
sudo curl -L http://install.ohmyz.sh | sh
cd ~/.oh-my-zsh && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
rm ~/.zshrc
ln -s ~/.vim/zshrc ~/.zshrc
wget https://raw.githubusercontent.com/rupa/z/master/z.sh
printf "\n\n#initialize Z (https://github.com/rupa/z) \n. ~/z.sh \n\n" >> .zshrcsource ~/.zshrc
touch ~/.z

#Varie
sudo apt install vim-gtk -y
sudo apt install git -y
sudo apt install tmux -y
sudo apt install curl -y
sudo apt-get install silversearcher-ag -y
sudo apt install tree -y
sudo apt install telegram-desktop -y
sudo apt install slack -y
npm -g install instant-markdown-d

#Yarn
sudo apt remove cmdtest
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn

#Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install google-chrome-stable

#git
git config --global user.name "Mattia46"
git config --global user.email "mattia.assogna@gmail.com"
git config --global core.autocrlf input
git config --global core.safecrlf true

#git ssh
sudo apt install xclip
ssh-keygen -t rsa -b 4096 -C "mattia.assogna@gmail.com"
#PASSWORD
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub
#Paste key in github
sh -T git@github.com
ssh-add ~/.ssh/id_rsa # Or whenever ssh-key name you have

#Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd ~/.vim/bundle && git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs
cd ~/.vim/bundle && git clone https://github.com/vimwiki/vimwiki.git
mv ~/Dropbox/vimrc ~/.vimrc
mv ~/Dropbox/tmux.conf ~/.tmux.conf
mv ~/Dropbox/tmux-theme.sj ~/.vim/tmux-theme.sh
mv ~/Dropbox/autoload ~/.vim/


#To install:
 #- Spotify
 #- Chrome
 #- Change CapLock to CTRL
