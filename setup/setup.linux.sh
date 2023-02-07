install_nvim() {
  if ! command -v nvim &> /dev/null
  then
    yum -y install neovim
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
    yum -y install tmux
  fi
}
