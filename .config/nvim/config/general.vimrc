syntax on
filetype plugin indent on

set wildignorecase
set wildmenu
set hlsearch
set incsearch
set clipboard=unnamed,unnamedplus
set ignorecase
set smartcase
set autoindent
set ruler
set confirm
set backspace=2
set number

" Tab settings
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set autoread
set autochdir
set cursorline
set novisualbell
set noerrorbells
set hidden
set laststatus=2
set background=dark
set completeopt=menu
set lazyredraw
set mouse=a


autocmd BufWritePre * :%s/\s\+$//e
colorscheme colorsbox-stnight
let mapleader = " "


function! FormatJSON()
    :%!python -m json.tool
endfunction
