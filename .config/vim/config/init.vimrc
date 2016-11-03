set nocompatible

" Set up vim plugins
call plug#begin('~/.vim/plugged')
Plug 'L9'
" Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'lilydjwg/colorizer'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gregsexton/MatchTag'
Plug 'osyo-manga/vim-over'

" Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'tmhedberg/matchit'
Plug 'elzr/vim-json', {'for':'json'}
Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'
Plug 'mkarmona/colorsbox'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-endwise'

" Autocompletion stuff
Plug 'shougo/neocomplete'
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


Plug 'editorconfig/editorconfig-vim'
call plug#end()

