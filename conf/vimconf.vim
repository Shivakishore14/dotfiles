
" tab space
set tabstop=4
set shiftwidth=4

" line numbers
set number relativenumber
set nu rnu

"key remap for arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

let g:netrw_winsize = 25

" ctrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
