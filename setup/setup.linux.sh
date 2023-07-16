install_nvim() {
  if ! command -v nvim &> /dev/null
  then
    sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
    sudo yum install -y neovim python3-neovim
  fi
}

install_fzf() {
  # TODO: implement
  if ! command -v fzf &> /dev/null
  then
    echo "Please install FZF manually"
  fi
}

install_hack_nerd_font() {
  # TODO: implement
  echo "Please instal Hack nerd font manually"
}

install_tmux() {
  if ! command -v tmux &> /dev/null
  then
    sudo yum -y install tmux
  fi
}
