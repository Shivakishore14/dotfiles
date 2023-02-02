
install_nvim() {
    if ! command -v nvim &> /dev/null
    then
        NONINTERACTIVE=1 brew install neovim
    fi
}

install_fzf() {
    if ! command -v fzf &> /dev/null
    then
        NONINTERACTIVE=1 brew install fzf
        $(brew --prefix)/opt/fzf/install --all
    fi
}

install_hack_nerd_font() {
   if ! brew list | grep font-hack-nerd-font -q
   then
       brew tap homebrew/cask-fonts && brew install --cask font-hack-nerd-font
   fi
}

install_tmux() {
   if ! command -v tmux &> /dev/null
   then
      NONINTERACTIVE=1 brew install tmux
   fi
}
