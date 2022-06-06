require('conf.basic')
require('conf.keymaps')

local Plug = require 'usermod.vimplug'

Plug.begin('~/.config/nvim/plugged')

Plug 'moll/vim-bbye'
Plug('junegunn/goyo.vim', {ft = 'markdown'})
Plug('VonHeikemen/rubber-themes.vim', {
  run = function()
    vim.opt.termguicolors = true
    vim.cmd('colorscheme rubber')
  end
})
Plug('b3nj5m1n/kommentary', {
  config = function()
    local cfg = require('kommentary.config')

    cfg.configure_language('default', {
      prefer_single_line_comments = true,
    })
  end
})

Plug '9mm/vim-closer'
Plug 'neovim/nvim-lspconfig'
Plug 'junegunn/fzf.vim'

Plug.ends()

