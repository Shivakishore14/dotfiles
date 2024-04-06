vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.scrolloff = 10

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "number"

vim.g.mapleader = " "
vim.o.mouse = "a"
vim.opt.clipboard = "unnamed"

-- Disable swap file
vim.opt.swapfile = false
-- Enable break indent
vim.o.breakindent = true
-- Save undo history
vim.o.undofile = true


require('config.tree-sitter')
require('config.lsp')
require('config.nvim-tree')
require('config.comment')
require('config.formatter')
require('config.code-folding')

vim.cmd("colorscheme nightfox")
