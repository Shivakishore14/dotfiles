
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