" Set up vim plugins
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
call plug#begin('~/.config/vim/plugged')
Plug 'L9'
" Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
" Plug 'lilydjwg/colorizer'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gregsexton/MatchTag'
Plug 'osyo-manga/vim-over'

Plug 'jlanzarotta/bufexplorer'

" Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'tmhedberg/matchit'
Plug 'elzr/vim-json', {'for':'json'}
Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'
Plug 'mkarmona/colorsbox'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-endwise'

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Autocompletion stuff - Must have clang installed
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
" Plug 'zchee/deoplete-clang'
Plug 'ervandew/supertab'

" Go stuff
Plug 'fatih/vim-go'
" Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/vim/symlink.sh' }

" Python stuff
" Plug 'nvie/vim-flake8'
" Plug 'tell-k/vim-autopep8'

" Rust stuff
Plug 'rust-lang/rust.vim'

" Async Makers
" Plug 'neomake/neomake'


Plug 'rhysd/vim-clang-format'

Plug 'google/vim-ft-bzl'

Plug 'kien/rainbow_parentheses.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-sleuth'

" Nerdtree stuff
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Special plugins that extend the vim language
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/InsertChar'
Plug 'vim-scripts/argtextobj.vim'

Plug 'vim-scripts/Align'

Plug 'JuliaEditorSupport/julia-vim'

Plug 'elixir-lang/vim-elixir'

Plug 'editorconfig/editorconfig-vim'
call plug#end()
call glaive#Install()
