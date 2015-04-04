set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
set encoding=utf-8

" Set up vim plugins
call vundle#rc('~/.vim/bundle')
Bundle 'gmarik/Vundle.vim'
Bundle 'L9'
Bundle 'bling/vim-airline'
Bundle 'jiangmiao/auto-pairs'
Bundle 'lilydjwg/colorizer'
Bundle 'JazzCore/ctrlp-cmatcher'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'digitaltoad/vim-jade'
" Jedi not needed because YouCompleteMe includes it by default
"Bundle 'davidhalter/jedi-vim'
Bundle 'gregsexton/MatchTag'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/nginx.vim'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'scrooloose/syntastic'
" Requires running npm install
Bundle 'marijnh/tern_for_vim'
Bundle 'leafgarland/typescript-vim'
Bundle 'mxw/vim-jsx'
Bundle 'SirVer/ultisnips'
Bundle 'paranoida/vim-airlineish'
Bundle 'altercation/vim-colors-solarized'
Bundle 'terryma/vim-expand-region'
Bundle 'tmhedberg/matchit'
Bundle 'tpope/vim-fugitive'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'elzr/vim-json'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'honza/vim-snippets'
" Requires running install.sh
Bundle 'Valloric/YouCompleteMe'
Bundle 'ervandew/supertab'

" Color scheme installs
Bundle 'mopp/mopkai.vim'
Bundle 'chriskempson/base16-vim'

syntax on

filetype on
filetype plugin indent on
au BufRead,BufNewFile *.ts setlocal filetype=typescript
autocmd FileType html setlocal shiftwidth=2 tabstop=2
"au FileType javascript call JavaScriptFold()
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif
autocmd FileType jade setlocal shiftwidth=2 tabstop=2
autocmd FileType lua setlocal shiftwidth=2 tabstop=2
set t_Co=256
set wildmenu
set hlsearch
set incsearch
set clipboard=unnamedplus
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

set autochdir
set cursorline
set novisualbell
set noerrorbells
set hidden
set laststatus=2
set background=dark
set completeopt=menu
set lazyredraw

let base16colorspace=256
colorscheme mopkai
let g:airline_theme = 'powerlineish'


let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" vim-airline configuration
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline_left_sep=' '
"let g:airline_right_sep=' '
"let g:airline_theme = 'airlineish'
"let g:airline_exclude_preview=1
"let g:airline_section_b = '%{strftime("%m/%d %X (%Z)")}'
"let g:airline_section_gutter = '%<%F'
"let g:airline_section_c = '%F'
"let g:airline_section_y = '%l,%c %P'
"let g:airline_section_z = '%{FileSize()}'
""let g:airline_section_gutter = ''
"let g:airline_section_warning = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_detect_modified=1
let g:airline#extensions#default#section_truncate_width = {
      \ 'b': 90,
      \ 'y': 60,
      \ }

"let g:ycm_add_preview_to_completeopt=0

let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<shift-tab>"

let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" Sessions config
let g:session_autosave = 'no'
let g:session_autoload = 'yes'
map <C-s> :SaveSession!<CR>
map <C-d> :OpenSession<CR>

let mapleader = ","
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" use jk to esc in insert mode
inoremap jk <esc>
nnoremap ; :
let g:ctrlp_map = '<c-p>'
"nnoremap <C-@> :NerdTreeToggle<CR>
highlight Comment ctermfg=blue
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
nnoremap <silent> <leader><esc> :noh<return><esc>
nnoremap J <C-w>j
nnoremap K <C-w>k
nnoremap H <C-w>h
nnoremap L <C-w>l
nnoremap <C-H> :call MarkWindowSwap()<CR> <C-w>h :call DoWindowSwap()<CR>
nnoremap <C-J> :call MarkWindowSwap()<CR> <C-w>j :call DoWindowSwap()<CR>
nnoremap <C-K> :call MarkWindowSwap()<CR> <C-w>k :call DoWindowSwap()<CR>
nnoremap <C-L> :call MarkWindowSwap()<CR> <C-w>l :call DoWindowSwap()<CR>
nmap <Space> i_<Esc>r
map <Tab> :bnext<CR>
map <S-Tab> :bprevious<CR>
map <leader>t :enew<CR>
nmap <leader>q :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
command! Q q
command! W w
command! Wq wq
command! WQ wq
map <leader>w :bd<CR>
map Q <Nop>
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
nnoremap Y y$

if bufwinnr(1)
    map + <C-W>>
    map _ <C-W><
endif
function! TabFormatter(bufnr, buffers)
    return fnamemodify(bufname(a:bufnr), ':t')
endfunction

function! FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return ""
    endif
    if bytes < 1024
        return bytes . "b"
    else
        return (bytes / 1024) . "kb"
    endif
endfunction

function! MarkWindowSwap()
    " marked window number
    let g:markedWinNum = winnr()
    let g:markedBufNum = bufnr("%")
endfunction

function! DoWindowSwap()
    let curWinNum = winnr()
    let curBufNum = bufnr("%")
    " Switch focus to marked window
    exe g:markedWinNum . "wincmd w"

    " Load current buffer on marked window
    exe 'hide buf' curBufNum

    " Switch focus to current window
    exe curWinNum . "wincmd w"

    " Load marked buffer on current window
    exe 'hide buf' g:markedBufNum
endfunction

if has('nvim')
    " Fix for clipboard usage
    function! ClipboardYank()
        call system('xclip -i -selection clipboard', @@)
    endfunction
    function! ClipboardPaste()
        let @@ = system('xclip -o -selection clipboard')
    endfunction

    vnoremap <silent> y y:call ClipboardYank()<cr>
    vnoremap <silent> d d:call ClipboardYank()<cr>
    nnoremap <silent> p :call ClipboardPaste()<cr>p
endif
" Get rid of annoying help window
nmap <F1> <nop>
imap <F1> <nop>
vmap <F1> <nop>

function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    exec 'silent !ranger --choosefiles=' . shellescape(temp)
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>r :<C-U>RangerChooser<CR>
nnoremap <C-@> :<C-U>RangerChooser<CR>
