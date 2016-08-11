set nocompatible       " required
filetype off           " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" Add all your plugins here (note older versions of Vundle used bundle instead of Plugin)
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"Plugin 'tmhedberg/SimpylFold'
"Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added befor the following line
call vundle#end()         " required
filetype plugin indent on " required

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-W>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
noremap <space> za

" Set to see docstring when folding
" let g:SimpylFold_docstring_preview=1

" Flagging unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Powerline
set laststatus=2
set t_Co=256

" UTF-8 Support
set encoding=utf-8

" Auto complete
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap gl :YcmCompleter GoToDeclaration<CR>
nnoremap gf :YcmCompleter GoToDefinition<CR>
nnoremap gv :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nmap <F6> :YcmDiags<CR>

" Ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] 

" Highlight
let python_highlight_all=1
syntax on

" Theme
if has('gui_running')
   set background=dark
   colorscheme solarized
else
   colorscheme zenburn
endif
" switch the theme
call togglebg#map("<F3>")

" Set number line
set nu
set relativenumber

set noswapfile

" NERDTree automatically start up
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Indent settings
" au BufNewFile, BufRead *.py
"    \ set tabstop=2
"    \ set softtabstop=2
"    \ set shiftwidth=2
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix
set expandtab
set textwidth=120
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

set backspace=indent,eol,start
set ruler
set showcmd
"au BufNewFile, BufRead *.html, *.js, *.css
"    \ set tabstop=2
"    \ set softtabstop=2
"    \ set shiftwidth=2

autocmd FileType python nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<cr>
map <F4> <Esc>:w<CR>
" map <C-q> <Esc>:qa<CR>

" Python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

" Tmux
if exists('$TMUX')
    set term=screen-256color
endif

" ESC
inoremap jj <ESC>

" Leader
let mapleader = "\<Space>"

noremap <leader>o :CtrlP<CR>
noremap <leader>w :w<CR>
nmap <leader><leader> V
