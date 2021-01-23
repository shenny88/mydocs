#!/bin/bash
if [ $(which apt) ];then
  sudo apt install git -y
  sudo apt install curl -y
  sudo apt install zsh -y
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
  sudo apt install ruby ruby-devel -y
  cd /tmp
  git clone https://github.com/athityakumar/colorls.git
  sudo gem install colorls
else
  sudo pacman -Syy git curl zsh ruby ruby-devel
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
  cd /tmp
  git clone https://github.com/athityakumar/colorls.git
  sudo gem install colorls
fi
