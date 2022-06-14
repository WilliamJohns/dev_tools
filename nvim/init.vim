"set nocompatible        " disable compatibility to old-time vi
set showmatch           " show matching brackets.
set ignorecase          " case insensitive matching
set autoindent          " indent a new line the same amount as the line just typed
set number              " add line numbers
set tabstop=4           " number of columns occupied by a tab character
set expandtab           " converts tabs to white space
set shiftwidth=4        " width for autoindents
set softtabstop=4       " see multiple spaces as tabstops so <BS> does the right thing
set nowrap              " Disable text wrapping
set nu rnu              " Relative Line Numbers
set nohlsearch          " Disable search highlighting after search completion


" Auto install Vim-Plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Install Missing Plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugInstall --sync | source $MYVIMRC | endif

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'rafi/awesome-vim-colorschemes'    " Color Schemes
Plug 'bling/vim-airline'                " Status Bar
Plug 'davidhalter/jedi-vim'             " Python Completion
"Plug 'tpope/vim-fugitive'               " Git Tools
"Plug 'scrooloose/nerdtree'              " FileTreeExplorer
call plug#end()

" Color Schemes
" Set Default Color Scheme
" colorscheme jellybeans
" colorscheme materialbox
" colorscheme deus
" colorscheme space-vim-dark
" colorscheme anderson
" colorscheme gruvbox
" colorscheme gotham256
" colorscheme papercolor
colorscheme pink-moon
" colorscheme minimalist

" Configure Jedi
let g:python3_host_prog = '/home/will/.pyenv/versions/global/bin/python'    " Set Path to global Python from PyEnv
autocmd FileType python setlocal completeopt-=preview                       " Disable Doc String Popup

" Auto Commands
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup MY_AUTO_COMMANDS
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
