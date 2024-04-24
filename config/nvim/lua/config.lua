vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.scrolloff = 10

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamed"

vim.g.have_nerd_font = true
-- vim.opt.showmode = false

-- Case insensitive search unless \C or one capital letter is present
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Disable swap file
vim.opt.swapfile = false
-- Enable break indent
vim.opt.breakindent = true
-- Save undo history
vim.opt.undofile = true

require("config.tree-sitter")
require("config.lsp")
require("config.nvim-tree")
require("config.comment")
require("config.formatter")
require("config.code-folding")

-- vim.cmd("colorscheme nightfox")
