return {
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    -- ...
    -- Add the C language server and linter
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      -- Install the C language server and linter
      mason_lspconfig.setup({
        ensure_installed = { "neocmake", "clangd", "cmake", "pylsp", "ast-grep" },
      })

      -- Configure the C language server and linter
      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup()
        end,
      })
    end,
  },
}
