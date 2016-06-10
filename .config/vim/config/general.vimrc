syntax on
filetype plugin indent on


set encoding=utf-8
set t_Co=256
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
set scrolloff=5

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


autocmd BufWritePre * :%s/\s\+$//e
colorscheme colorsbox-stnight
let mapleader = " "

