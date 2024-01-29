"vim-codefmt==================================================================="
au FileType * nmap <Leader>= :FormatCode<cr>
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp AutoFormatBuffer clang-format
  "autocmd FileType dart AutoFormatBuffer dartfmt
  "autocmd FileType go AutoFormatBuffer gofmt
  "autocmd FileType gn AutoFormatBuffer gn
  " autocmd FileType html,css,json AutoFormatBuffer js-beautify
  "autocmd FileType java AutoFormatBuffer google-java-format
  " autocmd FileType python AutoFormatBuffer autopep8
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

Glaive codefmt clang_format_style="file"
Glaive codefmt clang_format_executable="/home/abrandemuehl/.local/bin/clang-format-4.0"
Glaive codefmt buildifier_executable="/home/abrandemuehl/.local/bin/buildifier"

"end vim-codefmt==============================================================="


"tablify======================================================================="

"end tablify==================================================================="

"rainbow_parentheses==========================================================="
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

" \ ['Darkblue',    'firebrick3'],
" \ ['Darkblue',    'SeaGreen3'],
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 13
"end rainbow_parentheses======================================================="

let g:clang_format#code_style = 'file'





"vim-go========================================================================"
au FileType go nmap <Leader>i <Plug>(go-implements)
au FileType go nmap <Leader>d <Plug>(go-doc-browser)
au FileType go nmap <Leader>o <Plug>(go-def-split)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>e <Plug>(go-rename)
"end vim-go===================================================================="




"nerdtree======================================================================"
map <leader>n :NERDTreeToggle<CR>
let g:NERDSpaceDelims = 1
let g:NERDTreeShowHidden=1
"end nerdtree=================================================================="


"neomake======================================================================="
" autocmd! BufWritePost * Neomake
" let g:neomake_c_enabled_makers=['clangcheck']
" let g:neomake_cpp_enabled_makers=['clangcheck']
" let g:neomake_cpp_clangcheck_maker = {
"             \ 'args': ['-extra-arg-before=-stdlib=libc++']
"             \}
"end neomake==================================================================="

"neomake_autolint=============================================================="
"end neomake_autolint=========================================================="

"clang_format=================================================================="
let g:clang_format#code_style='google'
" autocmd FileType cpp ClangFormatAutoEnable
"end clang_format=============================================================="

"YouCompleteMe================================================================="
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_strings = 0
let g:ycm_complete_in_comments = 0
let g:ycm_clangd_binary_path='clangd'
let g:ycm_clangd_args='--malloc-trim'

nmap <leader>o :YcmCompleter GoTo<CR>
"end YouCompleteMe============================================================="
"deoplete======================================================================"
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
"end deoplete=================================================================="
"
"deoplete-clang================================================================"
" let g:deoplete#sources#clang#libclang_path = "/usr/local/Cellar/llvm/3.6.2/lib/libclang.dylib"
" let g:deoplete#sources#clang#clang_header = "/usr/local/Cellar/llvm/3.6.2/lib/clang/3.6.2/include/"
"end deoplete-clang============================================================"

"neocomplete==================================================================="
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1
"end neocomplete==============================================================="


"gitgutter====================================================================="
let g:gitgutter_map_keys = 0
"end gitgutter=================================================================""

"fzf==========================================================================="
let g:fzf_buffers_jump = 1
nmap <leader>p :GFiles<CR>
nmap <C-P> :GFiles<CR>
"end fzf=======================================================================""


"supertab======================================================================"
" let g:SuperTabDefaultCompletionType = '<C-n>'
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"end supertab=================================================================="


"quickscope===================================================================="
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
"end quickscope================================================================"




"vim-commentary================================================================"
autocmd FileType c,cpp setlocal commentstring=//\ %s
autocmd FileType matlab setlocal commentstring=%\ %s
"end vim-commentary============================================================"


"vim-session=================================================================="
let g:workspace_autocreate = 1
let g:workspace_session_directory = $HOME . '/.config/nvim/sessions/'
let g:workspace_session_disable_on_args = 1
let g:workspace_undodir=$HOME . '/.config/nvim/undodir'
let g:workspace_persist_undo_history = 1
let g:workspace_autosave_always = 0
let g:workspace_autosave = 0
"end vim-session=============================================================="

"telescope.nvim==============================================================="
:nnoremap <C-p> :lua require'telescope.builtin'.git_files{}<CR>
"end telescope.nvim==========================================================="
