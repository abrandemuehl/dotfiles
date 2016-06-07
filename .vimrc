set nocompatible

" Set up vim plugins
call plug#begin('~/.vim/plugged')
Plug 'L9'
Plug 'bling/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'lilydjwg/colorizer'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gregsexton/MatchTag'
Plug 'rking/ag.vim'
Plug 'benekastah/neomake'
Plug 'osyo-manga/vim-over'

" Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'tmhedberg/matchit'
Plug 'elzr/vim-json', {'for':'json'}
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'mopp/mopkai.vim'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-endwise'

" Autocompletion stuff
Plug 'Valloric/YouCompleteMe', { 'do':'./install.sh' }
Plug 'ervandew/supertab'

" Go stuff
Plug 'fatih/vim-go'

Plug 'kien/rainbow_parentheses.vim'

" Nerdtree stuff
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Special plugins that extend the vim language
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/InsertChar'
Plug 'vim-scripts/argtextobj.vim'
call plug#end()
syntax on
filetype plugin indent on
au BufRead,BufNewFile *.ts setlocal filetype=typescript
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType jade setlocal shiftwidth=2 tabstop=2
autocmd FileType lua setlocal shiftwidth=2 tabstop=2
autocmd! BufWritePost * Neomake
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
" set lazyredraw

colorscheme mopkai


let g:EclimSignLevel = 'error'
let g:EclimLoggingDisabled = 1
let g:EclimCompletionMethod = 'omnifunc'
" autocmd FileType python setlocal omnifunc=jedi#completions
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0

let g:ag_working_path_mode="r"

" vim-airline configuration
let g:airline_theme = 'powerlineish'
" let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_detect_modified=1
" let g:airline#extensions#default#section_truncate_width = {
"       \ 'b': 90,
"       \ 'y': 60,
"       \ }


let g:NERDSpaceDelims = 1


let mapleader = " "

let g:ctrlp_map = '<Leader>o'
let g:ctrlp_use_caching=0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files=0
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files']
set wildignore+=*/tmp/*,*.so,*.sw*,*.zip,.git/*,*.class
nnoremap <Leader>o :CtrlP<cr>

let g:SuperTabDefaultCompletionType = '<C-n>'


map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1

" autocmd VimEnter * Accordion 2

" map <leader>f :Accordion 1<CR>




" Sessions config
let g:session_autosave = 'no'
let g:session_autoload = 'yes'
map <C-s> :SaveSession!<CR>

map <leader>vs :vs<CR>
map <leader>sp :sp<CR>
" nmap <silent> <Leader>vs <Plug>GoldenViewSplit

nmap <silent> <Leader>r :so ~/.vimrc<CR>

map <S-k> <Nop>
inoremap <Home> <esc>
inoremap <End> <esc>
nnoremap <Home> <esc>
nnoremap <End> <esc>
vnoremap <Home> <esc>
vnoremap <End> <esc>
" nnoremap ; :
nnoremap <silent> <leader><esc> :noh<return><esc>
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l
nnoremap <c-h> :call MarkWindowSwap()<CR> <C-w>h :call DoWindowSwap()<CR>
nnoremap <c-j> :call MarkWindowSwap()<CR> <C-w>j :call DoWindowSwap()<CR>
nnoremap <c-k> :call MarkWindowSwap()<CR> <C-w>k :call DoWindowSwap()<CR>
nnoremap <c-l> :call MarkWindowSwap()<CR> <C-w>l :call DoWindowSwap()<CR>
" nmap <Space> i_<Esc>r
nnoremap <leader>i :<C-U>call InsertChar#insert(v:count1)<CR>
nnoremap <leader>a l:<C-U>call InsertChar#insert(v:count1)<CR>
" map <Tab> :bnext<CR>
" map <S-Tab> :bprevious<CR>
" map <leader>t :enew<CR>
nmap <leader>q :q<CR>
nmap <leader>bl :ls<CR>
nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprevious<CR>
nmap <leader>; :
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
nnoremap Y y$
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk


" Set up some neomake stuff
" let g:neomake_cpp_clang_maker = {
"     \ 'args':['-std=c++11 -c'],
"     \ }
" let g:neomake_cpp_enabled_makers = ['clang']


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

    " Use ranger as my file chooser
    command! -bar RangerChooser call RangeChooser()
    nnoremap <leader>r :<C-U>RangerChooser<CR>
    nnoremap <C-@> :<C-U>RangerChooser<CR>

endif
" Get rid of annoying help window
nmap <F1> <nop>
imap <F1> <nop>
vmap <F1> <nop>

let g:qs_enable = 0
let g:qs_enable_char_list = [ 'f', 'F', 't', 'T' ]

function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw
        let needs_disabling = 1
    endif
    let letter = nr2char(getchar())
    if needs_disabling
        QuickScopeToggle
    endif
    return a:movement . letter
endfunction

" quick_scope maps, operator-pending mode included (can do 'df' with hint)
for i in g:qs_enable_char_list
	execute 'noremap <expr> <silent>' . i . " Quick_scope_selective('". i . "')"
endfor



"-----------------------------------------------------------------------------"
"                        Useful Vim Commands                                  "
"                                                                             "
" ``        jump back to before latest jump                                   "
" <C-o>     Execute one command and return to insert mode                     "
"                                                                             "
"-----------------------------------------------------------------------------"
