return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = { mason = false },
        lua_ls = { mason = false },
        pyright = { mason = false },
        tailwindcss = { mason = false },
        vtsls = { mason = false },
      },
    },
  },
}
