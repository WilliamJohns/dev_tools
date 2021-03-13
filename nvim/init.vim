" Indentation
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set nowrap          " Disable text wrapping
"set exrc            " Loads local rc files when present in a directory
set guicursor=      " Reset cursor stuling
set nu rnu          " Hybrid line number mode
set nohlsearch      " Disable search highlighting after search completion
set incsearch       " Enable incremental search highlighting
"set hidden          " Keep buffers hidden on swap instead of unloading
set scrolloff=8     " Pad scroll lines
set signcolumn=yes  " Enable Notice Column
set colorcolumn=120 " Column highlighting

" Auto install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'rafi/awesome-vim-colorschemes'    " Color Schemes
Plug 'tpope/vim-fugitive'               " Git Tools
Plug 'scrooloose/nerdtree'              " FileTreeExplorer
call plug#end()

" Set Default Color Scheme
" colorscheme jellybeans
" colorscheme materialbox
" colorscheme deus
" colorscheme space-vim-dark
" colorscheme anderson
" colorscheme gruvbox
" colorscheme gotham256
" colorscheme papercolor
colorscheme minimalist

" Modify NERDTree Appearance
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='-'

" Mappings
nnoremap <C-B> :NERDTreeToggle<CR>

" Auto Command Functions
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun


" Auto Commands
augroup MY_AUTO_COMMANDS
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

