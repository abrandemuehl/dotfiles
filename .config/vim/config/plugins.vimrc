"vim-codefmt==================================================================="
au FileType * nmap <Leader>= :FormatCode<cr>
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto AutoFormatBuffer clang-format
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

"end vim-codefmt==============================================================="


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



"fzf==========================================================================="
let g:fzf_buffers_jump = 1
nmap <leader>p :GFiles<CR>
nmap <C-P> :GFiles<CR>


"end fzf=======================================================================""

"ctrlp========================================================================="
"let g:ctrlp_map = '<Leader>p'
let g:ctrlp_use_caching=1
let g:ctrlp_max_files=0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_by_filename = 1
"let g:ctrlp_max_files=0
"let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files']
" set wildignore+=*/tmp/*,*.so,*.sw*,*.zip,.git/*,*.class
"nnoremap <Leader>p :CtrlP<cr>
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$|bazel-*',
\ 'file': '\.so$\|\.dat$|\.DS_Store$'
\ }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" if executable('ag')
"   set grepprg=ag\ --nogroup\ --nocolor

"   " let g:ctrlp_match_window = 'bottom,order:ttb'
"   " let g:ctrlp_switch_buffer = 0
"   " let g:ctrlp_working_path_mode = 'ra'
"   let g:ctrlp_use_caching = 0
"   let g:ctrlp_user_command = ['ag %s --files-with-matches -g ""']
"   " let g:ctrlp_user_command += ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" endif
" " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
" if executable('ag')
"     " Use Ag over Grep
"     set grepprg=ag\ --nogroup\ --nocolor
"     " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"     let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" endif
"end ctrlp====================================================================="



"supertab======================================================================"
let g:SuperTabDefaultCompletionType = '<C-n>'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"end supertab=================================================================="


"quickscope===================================================================="
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
"end quickscope================================================================"



"session======================================================================="
" let g:session_autosave = 'no'
" let g:session_autoload = 'prompt'
" let g:session_directory = '~/.config/vim/sessions'
" let g:session_default_name = '.session'
" let g:session_extension = '.vim'
" let g:session_default_overwrite = 1
" map <C-s> :SaveSession!<CR>
"end session==================================================================="



"airline======================================================================="
" let g:airline_theme = 'powerlineish'
" let g:airline_powerline_fonts = 1
" let g:airline_detect_modified=1
"end airline==================================================================="


"vim-commentary================================================================"
autocmd FileType c,cpp setlocal commentstring=//\ %s
autocmd FileType matlab setlocal commentstring=%\ %s
"end vim-commentary============================================================"

"eclim========================================================================="
let g:EclimSignLevel = 'error'
let g:EclimLoggingDisabled = 1
let g:EclimCompletionMethod = 'omnifunc'
"end eclim====================================================================="



"vim-flake8===================================================================="
" autocmd! BufWritePost python :call Flake8()<CR>
" let g:flake8_show_in_gutter = 1
" let g:flake8_show_in_file = 1
"end vim-flake8==============================================================="

"vim-autopep8=================================================================="
" autocmd! BufWritePost python :Autopep8<CR>
"end vim-autopep8============================================================="

"vim-session=================================================================="
let g:workspace_autocreate = 1
let g:workspace_session_directory = $HOME . '/.config/vim/sessions/'
let g:workspace_session_disable_on_args = 1
let g:workspace_undodir=$HOME . '/.config/vim/undodir'
let g:workspace_persist_undo_history = 1
let g:workspace_autosave_always = 0
let g:workspace_autosave = 0
"end vim-session=============================================================="
