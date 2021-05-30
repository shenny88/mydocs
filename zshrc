# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e ~/.local/share/zsh/manjaro-zsh-config ]]; then
  source ~/.local/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e ~/.local/share/zsh/manjaro-zsh-prompt ]]; then
  source ~/.local/share/zsh/manjaro-zsh-prompt
fi

# To customize prompt, run `p10k configure` or edit /usr/share/zsh/p10k.zsh.
[[ ! -f ~/.local/share/zsh/p10k.zsh ]] || source ~/.local/share/zsh/p10k.zsh

#alias
alias ll='ls -ltrh'
alias l='ls -altrh'
alias pacman='sudo pacman'
alias chown='sudo chown'
alias chmod='sudo chmod'
unalias df

#startups
neofetch

#Custom functions
vim () {
input_file="$1"
file_owner="$(sudo stat -c '%U' ${input_file})"
file_group="$(sudo stat -c '%G' ${input_file})"
if [[ "$file_owner" != "shenny" ]];then
  sudo vim "$input_file"
  sudo chown ${file_owner}:${file_group} "$input_file"
else
  /bin/vim $1
fi
}

df () {
sudo /sbin/df -x devtmpfs -x tmpfs -x squashfs $*
}
