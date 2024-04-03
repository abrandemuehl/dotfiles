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


lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = false,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = false,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        -- ['@parameter.outer'] = 'v', -- charwise
        -- ['@function.outer'] = 'V', -- linewise
        -- ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true or false
      include_surrounding_whitespace = true,
    },
  },
}
EOF


lua <<EOF
require('lsp')
require('copilot')
require('diagflow_config')

EOF


"vim-go========================================================================"
au FileType go nmap <Leader>i <Plug>(go-implements)
au FileType go nmap <Leader>d <Plug>(go-doc-browser)
au FileType go nmap <Leader>o <Plug>(go-def-split)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>e <Plug>(go-rename)
"end vim-go===================================================================="


"YouCompleteMe================================================================="
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_complete_in_strings = 0
" let g:ycm_complete_in_comments = 0
" let g:ycm_clangd_binary_path='clangd'
" let g:ycm_clangd_args='--malloc-trim'

" nmap <leader>o :YcmCompleter GoTo<CR>
"end YouCompleteMe============================================================="

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
