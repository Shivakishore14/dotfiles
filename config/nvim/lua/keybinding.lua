local keymap = vim.api.nvim_set_keymap
local keymap_opts = { noremap = true }

keymap('n', '<c-s>', ':w<CR>', keymap_opts)
keymap('i', '<c-s>', '<Esc>:w<CR>a', keymap_opts)

keymap('n', '<c-j>', '<c-w>j', keymap_opts)
keymap('n', '<c-h>', '<c-w>h', keymap_opts)
keymap('n', '<c-k>', '<c-w>k', keymap_opts)
keymap('n', '<c-l>', '<c-w>l', keymap_opts)
keymap('n', '<c-n>', ':NvimTreeToggle<CR>', keymap_opts)

keymap('n', '<leader>ff', ':Telescope find_files<cr>', keymap_opts)
keymap('n', '<leader>fg', ':Telescope live_grep<cr>', keymap_opts)
keymap('n', '<leader>fb', ':Telescope buffers<cr>', keymap_opts)
keymap('n', '<leader>gg', ':LazyGit<cr>', keymap_opts)
