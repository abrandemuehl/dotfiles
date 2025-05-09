" Set up vim plugins
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-scripts/L9'
Plug 'jiangmiao/auto-pairs'


" HTML tag matching
Plug 'gregsexton/MatchTag'

" Use % jumping on multi letter tags
Plug 'tmhedberg/matchit'

Plug 'jlanzarotta/bufexplorer'

Plug 'elzr/vim-json', {'for':'json'}
Plug 'xolox/vim-misc'
Plug 'mkarmona/colorsbox'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-endwise'

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Autocompletion stuff - Must have clangd installed
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvimtools/none-ls.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'google/vim-ft-bzl'

Plug 'kien/rainbow_parentheses.vim'

Plug 'dgagn/diagflow.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-sleuth'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'BurntSushi/ripgrep'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }


" Copilot
" Plug 'github/copilot.vim'
Plug 'zbirenbaum/copilot.lua'
Plug 'zbirenbaum/copilot-cmp'
Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'main' }

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'


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
