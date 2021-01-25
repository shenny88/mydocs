#!/bin/bash
if [ $(which apt) ];then
  sudo apt install git -y
  sudo apt install curl -y
  sudo apt install zsh -y
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
  sed -i "/^ZSH_THEME=/c\ZSH_THEME=powerlevel10k/powerlevel10k" /home/shenny/.zshrc
  sudo apt install ruby ruby-devel -y
  cd /tmp
  git clone https://github.com/athityakumar/colorls.git
  gem install colorls
  sudo cp /home/shenny/.gem/ruby/*/bin/colorls /bin
  sudo chown shenny. /bin/colorls
  cd /tmp
  git clone git@github.com:shenny88/mydocs.git
  cd mydocs/vimrc
  cp -r vim /home/shenny/.vim
  cp vimrc /home/shenny/.vimrc
else
  sudo pacman -Syy git curl zsh ruby gcc make
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
  sed "/^ZSH_THEME=/c\ZSH_THEME=powerlevel10k/powerlevel10k" /home/shenny/.zshrc
  cd /tmp
  git clone https://github.com/athityakumar/colorls.git
  gem install colorls
  sudo cp /home/shenny/.gem/ruby/*/bin/colorls /tmp
  sudo chown shenny. /bin/colorls
  git clone git@github.com:shenny88/mydocs.git
  cd mydocs/vimrc
  cp -r vim /home/shenny/.vim
  cp vimrc /home/shenny/.vimrc
  cd /tmp/mydocs
  sudo cp sudoers /etc/sudoers.d/shenny
  sudo cp fixplasma /bin/fixplasma
  sudo chmod +x /bin/fixplasma
  git config --global user.email "shenny88@gmail.com"
  git config --global user.name "shennyrs"
fi
