local keymap = vim.api.nvim_set_keymap
local keymap_opts = { noremap = true }

-- Clear highlight on escape
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", keymap_opts)

-- ctrl - s => save
keymap("n", "<c-s>", ":w<CR>", keymap_opts)
keymap("i", "<c-s>", "<Esc>:w<CR>a", keymap_opts)

keymap("n", "<c-j>", "<c-w>j", keymap_opts)
keymap("n", "<c-h>", "<c-w>h", keymap_opts)
keymap("n", "<c-k>", "<c-w>k", keymap_opts)
keymap("n", "<c-l>", "<c-w>l", keymap_opts)
keymap("n", "<c-n>", ":NvimTreeToggle<CR>", keymap_opts)

-- Telescope keymaps
keymap("n", "<leader>ff", ":Telescope find_files<cr>", keymap_opts)
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", keymap_opts)
keymap("n", "<leader>fb", ":Telescope buffers<cr>", keymap_opts)
keymap("n", "<leader>ht", ":Telescope help_tags<cr>", keymap_opts)

-- Lazy git
keymap("n", "<leader>gg", ":LazyGit<cr>", keymap_opts)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
