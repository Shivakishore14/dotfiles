vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "number"

vim.g.mapleader = " "
vim.o.mouse = "a"
vim.opt.clipboard = "unnamed"



require('config.tree-sitter')
require('config.lsp')
require('config.nvim-tree')
require('config.comment')

vim.cmd("colorscheme nightfox")
