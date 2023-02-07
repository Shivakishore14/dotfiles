PROJECT_PATH=$HOME/github/dotfiles

if ! test "$1" = "--local"
then
  PROJECT_PATH=$HOME/.config/dotfiles
  if test -d $PROJECT_PATH
  then
    pushd $PROJECT_PATH
    git pull origin master
    popd
  else
    git clone https://github.com/shivakishore14/dotfiles $PROJECT_PATH
  fi
fi

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

# Install node
if ! test -d ~/.nvm
then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
if ! command -v node &> /dev/null
then
    nvm install node
fi

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
npm install -g pyright


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

