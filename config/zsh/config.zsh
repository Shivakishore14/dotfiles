plugins=(git aliases vi-mode zsh-autosuggestions fzf aws)

ZSH_THEME="robbyrussell"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# alias
alias vim=nvim
alias vi=nvim
alias v=nvim


# add pip binaries to path
export PATH=/Users/shiva/Library/Python/3.9/bin:$PATH
