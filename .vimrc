execute pathogen#infect()
filetype plugin indent on
set nocompatible
syntax on

set term=builtin_beos-ansi

"---ADDITION 1.1 Navigation plugin ---
"--- NerdTree -----
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 0
let g:NERDTreeWinSize=15
"--- ~ADDITION 1.1  ---

"--- ADDITION 1.3 ---
"--- Key mapping for macbook with touchbar
""'jj' and 'jk' throw you into normal mode
inoremap jj <esc>
inoremap jk <esc>
inoremap uns using namespace std;
inoremap incl #include <iostream>
inoremap c1 cout <<

"--- Command mapping for poor typists ---
command W w
command Wq wq
"--- ~ADDITION 1.3 ---

"--- ADDITION 1.2 ---
" current line is highlighted
set cursorline
"colorscheme
" Theme 
syntax enable
set background=dark   
colorscheme solarized
" display line numbers on the left
set number
"set line wrapping"
set textwidth=0 wrapmargin=0

"set indent width"
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
"--- ~ADDITION 1.2 ---

"Autofill directory"
set wildmode=full

inoremap {<CR> {<CR>}<C-o>O

inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

set nocompatible
"filetype plugin on       " may already be in your .vimrc


"YouCompleteMe"
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

"Highlight anything that goes over 80 characters"

highlight ColorColumn ctermbg=gray
set colorcolumn=80


call pathogen#helptags()


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'

call vundle#end()

filetype plugin indent on



" --- Useful IDE Stuff ---
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'Raimondi/delimitMate'

" --- Git Stuff ---
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set expandtab
set textwidth=120
set clipboard=unnamed

hi clear SignColumn

" --- EasyTag Config ---
set tags=./tags;,~/.vimtags
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

nmap <silent> <leader>b :TagbarToggle<CR>

" --- delimitMate config ---
let delimitMate_expand_cr = 1
augroup mydelimitMate
	au!
	au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
	au FileType tex let b:delimitMate_quotes = ""
	au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
	au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" --- Map Window Pane Toggle ---
nmap ,, <c-w><c-w>
nmap <M-Right> gt
