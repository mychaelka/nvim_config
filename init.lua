-- global options
vim.o.termguicolors = true
vim.o.syntax = 'on'
vim.o.errorbells = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartcase = true
vim.o.showmode = false
vim.o.completeopt = 'menuone,noinsert,noselect'

-- buffer-scoped options
vim.bo.autoindent = true
vim.bo.smartindent = true

-- window options
vim.wo.number = true              -- show column number
vim.wo.relativenumber = false     
vim.wo.signcolumn = 'yes'
vim.wo.wrap = true

vim.g.mapleader = ' '


-- lazypath plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- installing plugins
require("lazy").setup({
  {
    {
    "fenetikm/falcon",
    name = 'falcon',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme falcon]])
    end,
  },

     -- Highlight, edit, and navigate code
   'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  }

})
