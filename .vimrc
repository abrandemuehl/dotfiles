set nocompatible

" Set up vim plugins
call plug#begin('~/.vim/plugged')
"Plug 'gmarik/Vundle.vim'
Plug 'othree/html5.vim'
Plug 'lybrown/vim-pasm'
Plug 'chrisbra/improvedft'
Plug 'L9'
Plug 'bling/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'lilydjwg/colorizer'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/FuzzyFinder'
Plug 'digitaltoad/vim-jade', {'for':'jade'}
Plug 'gregsexton/MatchTag'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/nginx.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'benekastah/neomake'
" Requires running npm install
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'leafgarland/typescript-vim', {'for': 'javascript'}
Plug 'jelera/vim-javascript-syntax', {'for':'javascript'}
Plug 'pangloss/vim-javascript', {'for':'javascript'}
Plug 'mxw/vim-jsx', {'for': 'jsx'}
Plug 'SirVer/ultisnips'
Plug 'kshenoy/vim-signature'
Plug 'paranoida/vim-airlineish'
Plug 'terryma/vim-expand-region'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-fugitive'
Plug 'elzr/vim-json', {'for':'json'}
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'honza/vim-snippets'
Plug 'jplaut/vim-arduino-ino', {'for':'arduino'}
Plug 'Valloric/YouCompleteMe', { 'do':'./install.sh' }
"Plug 'Shougo/neocomplete.vim'
Plug 'ervandew/supertab'
" Plug 'terryma/vim-multiple-cursors'

" Color scheme installs
Plug 'mopp/mopkai.vim'
" Plug 'chriskempson/base16-vim'
call plug#end()



syntax on

filetype on
filetype plugin indent on
au BufRead,BufNewFile *.ts setlocal filetype=typescript
autocmd FileType html setlocal shiftwidth=2 tabstop=2
"au FileType javascript call JavaScriptFold()
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif
autocmd FileType jade setlocal shiftwidth=2 tabstop=2
autocmd FileType lua setlocal shiftwidth=2 tabstop=2
set encoding=utf-8
set t_Co=256
set wildmenu
set wildignorecase
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

" let base16colorspace=256
colorscheme mopkai
hi Comment ctermfg=245
let g:airline_theme = 'powerlineish'


let g:EclimSignLevel = 'error'
let g:EclimLoggingDisabled = 1
let g:EclimCompletionMethod = 'omnifunc'
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.txt'
let g:notes_unicode_enabled = 1

autocmd! BufWritePost * Neomake

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


" let g:acp_enableAtStartup = 0
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 3
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return neocomplete#close_popup() . "\<CR>"
" endfunction
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"let g:ycm_add_preview_to_completeopt=0


let g:ft_improved_nomap_comma = 1
let g:ft_improved_nomap_semicolon = 1

let mapleader = ","

let g:ctrlp_map = '<Leader>o'
let g:ctrlp_use_caching=0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files=0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
set wildignore+=*/tmp/*,*.so,*.sw*,*.zip,.git/*,*.class
nnoremap <Leader>o :CtrlP<cr>
" let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<shift-tab>"


" Sessions config
let g:session_autosave = 'no'
let g:session_autoload = 'yes'
map <C-s> :SaveSession!<CR>
map <C-d> :OpenSession<CR>

let mapleader = ","
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" use jk to esc in insert mode
inoremap jk <esc>
inoremap <Home> <esc>
inoremap <End> <esc>
nnoremap <Home> <esc>
nnoremap <End> <esc>
vnoremap <Home> <esc>
vnoremap <End> <esc>
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
nnoremap <c-h> :call MarkWindowSwap()<CR> <C-w>h :call DoWindowSwap()<CR>
nnoremap <c-j> :call MarkWindowSwap()<CR> <C-w>j :call DoWindowSwap()<CR>
nnoremap <c-k> :call MarkWindowSwap()<CR> <C-w>k :call DoWindowSwap()<CR>
nnoremap <c-l> :call MarkWindowSwap()<CR> <C-w>l :call DoWindowSwap()<CR>
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
nnoremap <leader>cc :call NERDComment(0, 'toggle')<CR>

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
    "function! ClipboardYank()
    "    call system('xclip -i -selection clipboard', @@)
    "endfunction
    "function! ClipboardPaste()
    "    let @@ = system('xclip -o -selection clipboard')
    "endfunction

    "vnoremap <silent> y y:call ClipboardYank()<cr>
    "vnoremap <silent> d d:call ClipboardYank()<cr>
    "nnoremap <silent> p :call ClipboardPaste()<cr>p

    " Map esc to leave terminal mode
    tnoremap <Esc> <C-\><C-n>
else
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
endif
" Get rid of annoying help window
nmap <F1> <nop>
imap <F1> <nop>
vmap <F1> <nop>

" Use ranger as my file chooser
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>r :<C-U>RangerChooser<CR>
nnoremap <C-@> :<C-U>RangerChooser<CR>
