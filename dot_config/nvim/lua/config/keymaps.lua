vim.keymap.set({ "n", "i" }, "<C-s>", "<cmd>write<cr>", { desc = "Save file" })

vim.keymap.set("n", "<C-n>", function()
  Snacks.explorer()
end, { desc = "Explorer" })
