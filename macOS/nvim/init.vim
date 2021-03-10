set tabstop=2 softtabstop=2
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set signcolumn=yes

call plug#begin('~/.local/share/nvim')

Plug 'gruvbox-community/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug '9mm/vim-closer'
Plug 'tweekmonster/startuptime.vim'

call plug#end()

set termguicolors
set background=dark
let g:gruvbox_italic = 1
colorscheme gruvbox
highlight Normal guibg=none

let mapleader = "\<Space>"

