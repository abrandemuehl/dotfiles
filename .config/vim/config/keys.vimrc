map <leader>vs :vs<CR>
map <leader>sp :sp<CR>
nmap <silent> <Leader>r :so ~/.vimrc<CR>

map <S-k> <Nop>
inoremap <Home> <esc>
inoremap <End> <esc>
nnoremap <Home> <esc>
nnoremap <End> <esc>
vnoremap <Home> <esc>
vnoremap <End> <esc>
nnoremap <silent> <leader><esc> :noh<return><esc>
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l

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


" Get rid of annoying help window
nmap <F1> <nop>
imap <F1> <nop>
vmap <F1> <nop>




nnoremap <c-h> :call MarkWindowSwap()<CR> <C-w>h :call DoWindowSwap()<CR>
nnoremap <c-j> :call MarkWindowSwap()<CR> <C-w>j :call DoWindowSwap()<CR>
nnoremap <c-k> :call MarkWindowSwap()<CR> <C-w>k :call DoWindowSwap()<CR>
nnoremap <c-l> :call MarkWindowSwap()<CR> <C-w>l :call DoWindowSwap()<CR>

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


