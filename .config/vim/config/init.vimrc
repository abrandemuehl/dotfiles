" Set up vim plugins
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
call plug#begin('~/.config/vim/plugged')
Plug 'L9'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gregsexton/MatchTag'
Plug 'osyo-manga/vim-over'

Plug 'jlanzarotta/bufexplorer'

Plug 'tmhedberg/matchit'
Plug 'elzr/vim-json', {'for':'json'}
Plug 'xolox/vim-misc'
Plug 'mkarmona/colorsbox'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-endwise'

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Autocompletion stuff - Must have clang installed
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'ervandew/supertab'

Plug 'rhysd/vim-clang-format'

Plug 'google/vim-ft-bzl'

Plug 'kien/rainbow_parentheses.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-sleuth'

" Nerdtree stuff
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'

" Special plugins that extend the vim language
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" Plug 'vim-scripts/InsertChar'
Plug 'vim-scripts/argtextobj.vim'

" Plug 'vim-scripts/Align'

" Plug 'JuliaEditorSupport/julia-vim'

" Plug 'elixir-lang/vim-elixir'

" Plug 'editorconfig/editorconfig-vim'
" Plug 'thaerkh/vim-workspace'

call plug#end()
call glaive#Install()
