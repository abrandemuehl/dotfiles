" Set up vim plugins
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
call plug#begin('~/.config/vim/plugged')
Plug 'vim-scripts/L9'
Plug 'jiangmiao/auto-pairs'


Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'gregsexton/MatchTag'
Plug 'osyo-manga/vim-over'

Plug 'jlanzarotta/bufexplorer'

" Plug 'grailbio/bazel-compilation-database'

Plug 'xolox/vim-session'

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

Plug 'mechatroner/rainbow_csv'

" RST table formatter
Plug 'Stormherz/tablify'

" Plug 'vim-scripts/Align'

" Plug 'JuliaEditorSupport/julia-vim'

" Plug 'elixir-lang/vim-elixir'

" Plug 'editorconfig/editorconfig-vim'
" Plug 'thaerkh/vim-workspace'

call plug#end()
call glaive#Install()
