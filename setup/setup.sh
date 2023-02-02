PROJECT_PATH=$HOME/github/dotfiles

source $PROJECT_PATH/setup/util.sh
if test isMac
then
    source $PROJECT_PATH/setup/setup.mac.sh
fi


# TODO: clone project locally



# install softwares
install_nvim
install_fzf
install_hack_nerd_font
install_tmux

mkdir -p ~/.config/alacritty/

# Setup neovim
if ! test -d ~/.config/nvim
then
    ln -s $PROJECT_PATH/config/nvim ~/.config/nvim
fi

## install packer
if ! test -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim
then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi
## install all nvim packar deps
nvim --headless +PackerSync +q

# Setup zsh
if test -z ${ZSH+x}
then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if ! test -d ~/.config/zsh
then
    ln -s $PROJECT_PATH/config/zsh ~/.config/zsh
fi

if ! grep -Fxq "source ~/.config/zsh/config.zsh" ~/.zshrc
then
    sed -i.bkup 's/source\ \$ZSH\/oh-my-zsh.sh/source ~\/.config\/zsh\/config.zsh\nsource \$ZSH\/oh-my-zsh.sh/' ~/.zshrc
fi

if ! test -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# setup alacritty
# .config/alacritty/alacritty.yml

cp -r $PROJECT_PATH/config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

if ! test -L ~/.tmux.conf
then
    ln -s $PROJECT_PATH/config/tmux/tmux.conf ~/.tmux.conf
fi
