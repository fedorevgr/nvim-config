return {
  {
    "williamboman/mason.nvim",
    config = true,
    -- ...
    -- Add the C language server and linter
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
      },
      config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")

        -- Install the C language server and linter
        mason_lspconfig.setup({
          ensure_installed = { "clangd", "clang-format" },
        })

        -- Configure the C language server and linter
        mason_lspconfig.setup_handlers({
          function(server_name)
            lspconfig[server_name].setup({})
          end,
        })
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- ...
      -- Enable C language support
      languages = {
        c = true,
      },
    },
  },
}
