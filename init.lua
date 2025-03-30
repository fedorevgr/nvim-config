-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("lspconfig")
require("cmake-tools")
require("mason")
require("config.options")

-- vim.cmd("colorscheme kanagawa")
-- require("kanagawa").load("dragon")
vim.cmd("colorscheme kanagawa-dragon")
